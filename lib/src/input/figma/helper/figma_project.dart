import 'package:pbdl/src/input/figma/entities/layers/canvas.dart';
import 'package:pbdl/src/input/figma/entities/layers/frame.dart';
import 'package:pbdl/src/input/figma/helper/figma_page.dart';
import 'package:pbdl/src/pbdl/pbdl_project.dart';
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
        pg.addScreen(FigmaScreen(
          figmaNode: layer,
          id: layer.UUID,
          name: layer.name,
        ));
      }
      figmaPages.add(pg);
    }
    return figmaPages;
  }

  PBDLProject interpretNode() {
    return PBDLProject(
      projectName: projectName,
      id: id,
      pages: pages.map((e) => e.interpretNode()).toList(),
    );
  }
}
