import 'package:get_it/get_it.dart';
import 'package:pbdl/src/input/figma/entities/layers/canvas.dart';
import 'package:pbdl/src/input/figma/entities/layers/component_set.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_frame.dart';
import 'package:pbdl/src/input/figma/entities/style/fill/fill_type.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_holder.dart';
import 'package:pbdl/src/input/figma/helper/api_call_service.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_page.dart';
import 'package:pbdl/src/pbdl/pbdl_project.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:quick_log/quick_log.dart';
import '../entities/layers/canvas.dart';
import 'figma_page.dart';

class FigmaProject {
  bool debug;

  Logger log = Logger('FigmaProject');

  List<FigmaPage> pages = [];

  String projectName;

  var figmaJson;

  String id;

  FigmaPage rootScreen;

  GlobalStyleHolder globalStyles;

  MainInfo _mainInfo;

  FigmaProject(
    this.projectName,
    this.figmaJson, {
    this.id,
  }) : super() {
    _mainInfo = MainInfo();
    globalStyles = GetIt.I.get<GlobalStyleHolder>();
    pages.addAll(_setConventionalPages(figmaJson['document']['children']));
  }

  /// Checks whether we have global styles to export in the project.
  Future<void> populateGlobalStyles() async {
    if (!figmaJson.containsKey('styles')) {
      return null;
    }

    Map<String, dynamic> jsonStyles = figmaJson['styles'];

    var ids = jsonStyles.keys;

    var stylingNodes =
        await APICallService.getFileNodes(id, ids, MainInfo().figmaKey);

    /// Get all images meta data, using imageReference or imageRef as key
    /// for their download url
    var metaData = await APICallService.makeAPICall(
        'https://api.figma.com/v1/files/${MainInfo().figmaProjectID}/images',
        MainInfo().figmaKey);
    var imagesByReference = metaData['meta']['images'];

    for (var entry in jsonStyles.entries) {
      // ?: [ApiCallService.getFileNodes] could return a [Map<String,dynamic>] to make this faster.
      var figmaNode = stylingNodes.firstWhere(
          (element) => element.UUID == entry.key,
          orElse: () => null);
      if (figmaNode != null) {
        // Need to condense all attributes into a single map for easier interpretation.
        var formattedJson = {
          'UUID': entry.key,
          'name': entry.value['name'],
          'styleType': entry.value['styleType'],
          'description': entry.value['description'],
        };
        var globalStyle =
            GlobalStyleProperty.fromJson(formattedJson, figmaNode);
        if (globalStyle != null) {
          // If the styleNode is a image fill type, replace imageRef for their download url
          if (globalStyle.styleNode is ImageFillType) {
            globalStyle.styleNode.imageRef = FigmaAssetProcessor()
                .processImageWithURL(globalStyle.UUID,
                    imagesByReference[globalStyle.styleNode.imageRef],
                    name: globalStyle.name);
          }
          globalStyles.add(globalStyle);
        }
      }
    }
  }

  List<FigmaPage> _setConventionalPages(var canvasAndArtboards) {
    var figmaPages = <FigmaPage>[];
    for (var canvas in canvasAndArtboards) {
      var pg = FigmaPage(name: canvas['name'], id: canvas['id']);

      var node = Canvas.fromJson(canvas);

      for (var layer in node.children) {
        // Skip current screen if its convert property is false

        if (layer.UUID == node.prototypeStartNodeID && layer is FigmaFrame) {
          layer.isFlowHome = true;
        }
        // If node is a component set
        // Add each component as a screen
        if (layer is FigmaComponentSet) {
          for (var child in layer.children) {
            pg = _mainInfo.integrationStrategy.execute(child, pg);
          }
        }
        // Else just add the screen
        else {
          pg = _mainInfo.integrationStrategy.execute(layer, pg);
        }
      }
      figmaPages.add(pg);
    }
    return figmaPages;
  }

  Future<PBDLProject> interpretNode() async {
    var processedPages = await Future.wait(
        pages.map((e) async => await e.interpretNode()).toList());
    return PBDLProject(
      name: projectName,
      UUID: id,
      pages: processedPages,
      pngPath: MainInfo().pngPath,
      globalStyles: await globalStyles.interpretNode(),
    );
  }
}
