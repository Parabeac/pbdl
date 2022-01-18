import 'package:pbdl/src/input/figma/entities/layers/canvas.dart';
import 'package:pbdl/src/input/figma/entities/layers/component_set.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_frame.dart';
import 'package:pbdl/src/input/figma/helper/figma_page.dart';
import 'package:pbdl/src/pbdl/pbdl_project.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:quick_log/quick_log.dart';
import '../entities/layers/canvas.dart';
import 'figma_page.dart';
import 'figma_screen.dart';

class FigmaProject {
  bool debug;

  Logger log = Logger('FigmaProject');

  List<FigmaPage> pages = [];

  String projectName;

  var figmaJson;

  String id;

  FigmaPage rootScreen;

  FigmaProject(
    this.projectName,
    this.figmaJson, {
    this.id,
  }) : super() {
    pages.addAll(_setConventionalPages(figmaJson['document']['children']));
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
        // If layer is a component set
        // Add each component as a screen
        if (layer is FigmaComponentSet) {
          for (var child in layer.children) {
            pg.addScreen(FigmaScreen(
              figmaNode: child,
              id: child.UUID,
              name: child.name,
              isVisible: child.isVisible,
            ));
          }
        }
        // Else just add the screen
        else {
          pg.addScreen(FigmaScreen(
            figmaNode: layer,
            id: layer.UUID,
            name: layer.name,
            isVisible: layer.isVisible,
          ));
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
    );
  }
}
