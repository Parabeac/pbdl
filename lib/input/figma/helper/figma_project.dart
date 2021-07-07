import 'package:quick_log/quick_log.dart';

import '../entities/layers/canvas.dart';
import 'figma_page.dart';
import 'figma_screen.dart';

class FigmaProject {
  bool debug;

  Logger log = Logger('FigmaProject');

  List<FigmaPage> pages;

  String projectName;

  var figmaJson;

  FigmaPage rootScreen;

  FigmaProject(
    this.projectName,
    this.figmaJson, {
    String id,
  }) : super() {
    pages.addAll(_setConventionalPages(figmaJson['document']['children']));
  }

  List<FigmaPage> _setConventionalPages(var canvasAndArtboards) {
    var figmaPages = <FigmaPage>[];
    for (var canvas in canvasAndArtboards) {
      // Skip current canvas if its convert property is false
      var pbdlPage = getFigmaPage(canvas['id']);
      if (pbdlPage != null && !(pbdlPage['convert'] ?? true)) {
        continue;
      }

      var pg = FigmaPage(name: canvas['name'], id: canvas['id']);

      var node = Canvas.fromJson(canvas);

      for (var layer in node.children) {
        // Skip current screen if its convert property is false
        var pbdlScreen = getFigmaScreen(pbdlPage, layer.UUID);
        if (pbdlScreen != null && !(pbdlScreen['convert'] ?? true)) {
          continue;
        }
        if (layer.UUID == node.prototypeStartNodeID) {
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

  Map getFigmaPage(String pageId) {
    // TODO: implement
    // Ask Ivan H to clarify
  }

  Map getFigmaScreen(Map figmaPage, String screenId) {
    // TODO: implement
    // Ask Ivan H to clarify
  }
}
