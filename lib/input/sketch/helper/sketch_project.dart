import 'dart:convert';
import 'package:pbdl/input/general_helper/input_formatter.dart';
import 'package:pbdl/input/sketch/entities/documents/document.dart';
import 'package:pbdl/input/sketch/entities/layers/page.dart';
import 'package:pbdl/input/sketch/entities/objects/foreign_symbol.dart';
import 'package:pbdl/input/sketch/entities/style/shared_style.dart';
import 'package:pbdl/input/sketch/helper/sketch_page.dart';
import 'package:pbdl/input/sketch/helper/sketch_screen.dart';
import 'package:pbdl/input/sketch/services/input_design.dart';
import 'package:quick_log/quick_log.dart';
import 'package:archive/archive.dart';
import 'package:recase/recase.dart';
import '../entities/documents/document.dart';
import '../entities/layers/page.dart';
import '../entities/objects/foreign_symbol.dart';
import '../entities/style/shared_style.dart';
import '../services/input_design.dart';
import 'sketch_page.dart';
import 'sketch_screen.dart';

class SketchProject {
  var log = Logger('SketchNodeTree');
  SketchPage rootScreen;

  @override
  String projectName;
  @override
  bool debug = false;

  String id;

  List<SketchPage> pages = [];
  List<SketchPage> miscPages = [];
  List<SharedStyle> sharedStyles = [];

  final InputDesignService _ids;
  Archive _originalArchive;
  final Map _pagesAndArtboards;
  SketchProject(this._ids, this._pagesAndArtboards, this.projectName) {
    id = _ids.documentFile['do_objectID'];
    _originalArchive = _ids.archive;
    miscPages.add(_setThirdPartySymbols());
    sharedStyles = _setSharedStyles();
    pages.addAll(_setConventionalPages(_pagesAndArtboards));
    if (debug) {
      print(pages);
    }
  }

  List<SharedStyle> _setSharedStyles() {
    try {
      List<SharedStyle> sharedStyles = [];
      var jsonData = _ids.documentFile;
      var doc = Document.fromJson(jsonData);
      if (doc.layerStyles != null) {
        var LayerStyles = doc.layerStyles['objects'] ?? [];
        for (var sharedStyle in LayerStyles) {
          var layerStyle = SharedStyle.fromJson(sharedStyle);
          layerStyle.name = PBInputFormatter.formatVariable(layerStyle.name);
          sharedStyles.add(layerStyle);
        }
      }

      if (doc.layerTextStyles != null) {
        var LayerTextStyles = doc.layerTextStyles['objects'] ?? [];

        for (var sharedStyle in LayerTextStyles) {
          var layerTextStyle = SharedStyle.fromJson(sharedStyle);
          layerTextStyle.name =
              PBInputFormatter.formatVariable(layerTextStyle.name.camelCase);
          sharedStyles.add(layerTextStyle);
        }
      }

      return sharedStyles;
    } catch (e, stackTrace) {
      //MainInfo().sentry.captureException(
      //   exception: e,
      //   stackTrace: stackTrace,
      // );
      log.error(e.toString());
      return null;
    }
  }

  SketchPage _setThirdPartySymbols() {
    try {
      var jsonData = _ids.documentFile;
      var doc = Document.fromJson(jsonData);
      var foreignLayers = doc.foreignSymbols ?? <ForeignSymbol>[];
      var pg =
          SketchPage(name: 'third_party_widgets', id: jsonData['do_objectID']);
      for (var layer in foreignLayers) {
        pg.addScreen(SketchScreen(
          designNode: layer.originalMaster,
          id: layer.UUID,
          name: '',
          type: layer.originalMaster.type,
        ));
      }
      return pg;
    } catch (e, stackTrace) {
      // MainInfo().sentry.captureException(
      //   exception: e,
      //   stackTrace: stackTrace,
      // );
      log.error(e.toString());
      return null;
    }
  }

  List<SketchPage> _setConventionalPages(Map pagesAndArtboards) {
    var sketchPages = <SketchPage>[];
    for (var entry in pagesAndArtboards.entries) {
      var pageContent =
          _originalArchive.findFile('pages/${entry.key}.json').content;
      var jsonData = json.decode(utf8.decode(pageContent));

      var pbdlPage = getSketchPage(jsonData['do_objectID']);
      if (pbdlPage != null && !(pbdlPage['convert'] ?? true)) {
        continue;
      }

      var pg = SketchPage(
          name: jsonData['name'],
          id: jsonData['do_objectID']); // Sketch Node Holder
      var node = Page.fromJson(jsonData); // Actual Sketch Node

      // Turn layers into PBNodes
      for (var layer in node.children) {
        var pbdlScreen = getSjetchScreen(pbdlPage, layer.UUID);
        if (pbdlScreen != null && !(pbdlScreen['convert'] ?? true)) {
          continue;
        }
        pg.addScreen(SketchScreen(
          designNode: layer,
          id: layer.UUID,
          name: layer.name,
          type: layer.type,
        ));
      }
      sketchPages.add(pg);
    }
    return sketchPages;
  }

  Map getSketchPage(String pageId) {
    // TODO: implement
    // ask Ivan H to clarify
  }

  Map getSjetchScreen(Map pbdlPage, String screenId) {
    // TODO: implement
    // ask Ivan H to clarify
  }
}
