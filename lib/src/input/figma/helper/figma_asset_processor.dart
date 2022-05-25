import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pbdl/src/input/figma/entities/style/figma_effect.dart';
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

  final List<String> _uuidSvgQueue = [];

  final Map<String, String> _uuidToName = {};

  List<String> get uuidQueue => _uuidQueue;

  Logger log = Logger('Figma Image helper');

  /// Adds [uuid] to queue to be processed as an image.
  /// Returns the formatted name of the image reference.
  @override
  String processImage(
    String uuid, {
    FigmaRect absoluteBoundingBox,
    String name,
    IMAGE_FORMAT format = IMAGE_FORMAT.PNG,
    List<FigmaEffect> effects,
  }) {
    if (format == IMAGE_FORMAT.SVG) {
      _uuidSvgQueue.add(uuid);
    } else if (absoluteBoundingBox != null &&
        absoluteBoundingBox.height > 0 &&
        absoluteBoundingBox.width > 0 &&
        (effects == null || effects.isEmpty)) {
      _uuidQueue.add(uuid);
    } else {
      _uuidNoBoxQueue.add(uuid);
    }

    var finalName = AssetProcessingService.getImageName(name);
    _uuidToName[uuid] = finalName;
    return ('images/' + finalName + '.${format.toShortLowerCaseString()}');
  }

  /// Adds [uuids] to queue to be processed as an image.
  /// Does NOT return image names when finished.
  void _addImagesToQueue(List<String> uuids) => _uuidQueue.addAll(uuids);

  /// Creates separate API requests from `uuidQueue` to speed up
  /// the image downloading process.
  Future<void> processImageQueue({bool writeAsFile = true}) async {
    var chunks = <List<String>>[];
    var boundlessChunk = <List<String>>[];
    var svgChunk = <List<String>>[];

    chunks.addAll(_getChunks(_uuidQueue));

    boundlessChunk.addAll(_getChunks(_uuidNoBoxQueue));

    svgChunk.addAll(_getChunks(_uuidSvgQueue));

    // Process images in separate queues
    var futures = <Future>[];

    futures.addAll(
        _getImagesToProcess(chunks, writeAsFile, IMAGE_FORMAT.PNG, true));

    futures.addAll(_getImagesToProcess(
        boundlessChunk, writeAsFile, IMAGE_FORMAT.PNG, false));

    futures.addAll(
        _getImagesToProcess(svgChunk, writeAsFile, IMAGE_FORMAT.SVG, false));

    // Wait for the images to complete writing process
    await Future.wait(futures, eagerError: true);
  }

  /// Passes the chunks to process each image at a time
  List<Future<dynamic>> _getImagesToProcess(
    List<List<String>> chunks,
    bool writeAsFile,
    IMAGE_FORMAT imageFormat,
    bool hasBounds,
  ) {
    var futuresToReturn = <Future>[];
    for (var uuidList in chunks) {
      futuresToReturn.add(_processImages(
        uuidList,
        writeAsFile: writeAsFile,
        hasBounds: hasBounds,
        imageFormat: imageFormat,
      ));
    }

    return futuresToReturn;
  }

  /// Method to get the queue into chunks
  /// for easier processing
  List<List<String>> _getChunks(List<String> queue) {
    var chunksToReturn = <List<String>>[];
    for (var i = 0; i < queue.length; i += IMAGE_REQ_LIMIT) {
      chunksToReturn.add(queue.sublist(
          i,
          i + IMAGE_REQ_LIMIT > queue.length
              ? queue.length
              : i + IMAGE_REQ_LIMIT));
    }

    return chunksToReturn;
  }

  /// Downloads the image with the given `UUID`
  /// and writes it to the `pngs` folder in the `outputPath`.
  /// Returns true if the operation was successful. Returns false
  /// otherwise.
  Future<dynamic> _processImages(
    List<String> uuids, {
    bool writeAsFile = true,
    bool hasBounds = true,
    IMAGE_FORMAT imageFormat,
  }) async {
    return Future(() async {
      var response = await APICallService.makeAPICall(
          'https://api.figma.com/v1/images/${MainInfo().figmaProjectID}?ids=${uuids.join(',')}&format=${imageFormat.toShortLowerCaseString()}&use_absolute_bounds=${hasBounds}',
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
              var imageName = _uuidToName[entry.key];
              var pngPath = p.join(MainInfo().pngPath,
                  '${imageName}.${imageFormat.toShortLowerCaseString()}');
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

enum IMAGE_FORMAT {
  PNG,
  JPG,
  SVG,
  PDF,
}

extension ImageFormatString on IMAGE_FORMAT {
  String toShortLowerCaseString() {
    return toString().split('.').last.toLowerCase();
  }
}
