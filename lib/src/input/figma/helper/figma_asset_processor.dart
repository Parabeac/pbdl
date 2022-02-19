import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pbdl/src/input/general_helper/asset_processing_service.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/input/figma/helper/api_call_service.dart';
import 'package:quick_log/quick_log.dart';
import 'api_call_service.dart';
import 'package:path/path.dart' as p;

import 'figma_rect.dart';

class FigmaAssetProcessor extends AssetProcessingService {
  /// Variable that represents how many images per request we are processing
  final IMAGE_REQ_LIMIT = 50;

  FigmaAssetProcessor._internal();

  static final FigmaAssetProcessor _instance = FigmaAssetProcessor._internal();

  factory FigmaAssetProcessor() => _instance;

  final List<String> _uuidQueue = [];

  final List<String> _uuidNoBoxQueue = [];

  List<String> get uuidQueue => _uuidQueue;

  Logger log = Logger('Figma Image helper');

  /// Adds [uuid] to queue to be processed as an image.
  /// Returns the formatted name of the image reference.
  @override
  String processImage(String uuid, [FigmaRect absoluteBoundingBox]) {
    if (absoluteBoundingBox != null &&
        absoluteBoundingBox.height > 0 &&
        absoluteBoundingBox.width > 0) {
      _uuidQueue.add(uuid);
    } else {
      _uuidNoBoxQueue.add(uuid);
    }

    return AssetProcessingService.getImageName(uuid);
  }

  /// Adds [uuids] to queue to be processed as an image.
  /// Does NOT return image names when finished.
  void _addImagesToQueue(List<String> uuids) => _uuidQueue.addAll(uuids);

  /// Creates separate API requests from `uuidQueue` to speed up
  /// the image downloading process.
  Future<void> processImageQueue({bool writeAsFile = true}) async {
    var chunks = <List<String>>[];
    var boundlessChuck = <List<String>>[];
    for (var i = 0; i < _uuidQueue.length; i += IMAGE_REQ_LIMIT) {
      chunks.add(_uuidQueue.sublist(
          i,
          i + IMAGE_REQ_LIMIT > _uuidQueue.length
              ? _uuidQueue.length
              : i + IMAGE_REQ_LIMIT));
    }

    for (var i = 0; i < _uuidNoBoxQueue.length; i += IMAGE_REQ_LIMIT) {
      boundlessChuck.add(_uuidNoBoxQueue.sublist(
          i,
          i + IMAGE_REQ_LIMIT > _uuidNoBoxQueue.length
              ? _uuidNoBoxQueue.length
              : i + IMAGE_REQ_LIMIT));
    }

    // Process images in separate queues
    var futures = <Future>[];
    for (var uuidList in chunks) {
      futures.add(
          _processImages(uuidList, writeAsFile: writeAsFile, hasBounds: true));
    }

    for (var uuidList in boundlessChuck) {
      futures.add(
          _processImages(uuidList, writeAsFile: writeAsFile, hasBounds: false));
    }

    // Wait for the images to complete writing process
    await Future.wait(futures, eagerError: true);
  }

  /// Downloads the image with the given `UUID`
  /// and writes it to the `pngs` folder in the `outputPath`.
  /// Returns true if the operation was successful. Returns false
  /// otherwise.
  Future<dynamic> _processImages(List<String> uuids,
      {bool writeAsFile = true, bool hasBounds = true}) async {
    return Future(() async {
      var response = await APICallService.makeAPICall(
          'https://api.figma.com/v1/images/${MainInfo().figmaProjectID}?ids=${uuids.join(',')}&use_absolute_bounds=${hasBounds}',
          MainInfo().figmaKey);

      if (response != null &&
          response.containsKey('images') &&
          response['images'] != null &&
          response['images'].values.isNotEmpty) {
        Map images = response['images'];
        // Download the images
        for (var entry in images.entries) {
          if (entry?.value != null && (entry?.value?.isNotEmpty ?? false)) {
            response =
                await http.get(Uri.parse(entry.value)).then((imageRes) async {
              // Check if the request was successful
              if (imageRes == null || imageRes.statusCode != 200) {
                log.error('Image ${entry.key} was not processed correctly');
              }

              var pngPath = p.join(MainInfo().pngPath, '${entry.key}.png');
              var file = File(pngPath.replaceAll(':', '_'))
                ..createSync(recursive: true);
              file.writeAsBytesSync(imageRes.bodyBytes);

              // TODO: Only print out when verbose flag is active
              // log.debug('File written to following path ${file.path}');
            }).catchError((e) {
              //MainInfo().sentry.captureException(exception: e);
              log.error(e.toString());
            });
          }
        }
        return response;
      } else {
        throw Exception('Image did not generate');
      }
    });
  }

  @override
  Future<void> processRootElements(Map uuids) async {
    _addImagesToQueue(uuids.keys.toList());
    await processImageQueue(writeAsFile: false);
  }

  List _listToChunks(List currentList, int chuckSize) {
    var temp = <String>[];
    var counter = 0;
    // ignore: omit_local_variable_types
    List<List<String>> listOnChunks =
        currentList.fold<List<List<String>>>([], (newList, i) {
      counter++;
      if (temp.length < chuckSize) {
        temp.add(i);
      }
      if (temp.length >= chuckSize || currentList.length == counter) {
        var newValue = List<String>.from(temp);
        newList.add(newValue);
        temp.clear();
      }
      return newList;
    });
    return listOnChunks;
  }
}
