// maybe we dont need this one anymore, or we might use it for PBDL

import 'package:pbdl/pbdl/abstract_design_node_factory.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'package:pbdl/pbdl/pbdl_page.dart';
import 'package:pbdl/input/sketch/entities/style/shared_style.dart';

class PBDLProject implements PBDLNodeFactory {
  String projectName;
  bool debug = false;
  String id;
  @override
  String pbdfType = 'project';

  PBDLProject({
    this.projectName,
    this.id,
  });

  List<PBDLPage> pages = [];
  List<PBDLPage> miscPages = [];
  List<SharedStyle> sharedStyles = [];

  /// Parabeac Design File
  Map<String, dynamic> toPBDF() {
    Map result = <String, dynamic>{};
    result['projectName'] = projectName;
    result['pbdfType'] = pbdfType;
    result['id'] = id;

    List<Map> tmpPages = [];
    List<Map> tmpMiscPages = [];
    for (var page in pages) {
      tmpPages.add(page.toPBDF());
    }
    for (var page in miscPages) {
      tmpMiscPages.add(page.toPBDF());
    }

    for (var sharedStyle in sharedStyles) {
      result.addAll(sharedStyle.toJson());
    }

    result['pages'] = tmpPages;
    result['miscPages'] = tmpMiscPages;

    return result;
  }

  factory PBDLProject.fromPBDF(Map<String, dynamic> json) {
    var project = PBDLProject(projectName: json['projectName'], id: json['id']);
    if (json.containsKey('pages')) {
      (json['pages'] as List)?.forEach((value) {
        if (value != null) {
          project.pages.add(PBDLPage.fromPBDF(value as Map<String, dynamic>));
        }
      });
    }
    return project;
  }

  /// Returns a [Map] that represents the PBDL page with ID `pageId`,
  /// or `null` if not found.
  Map getPbdlPage(String pageId) {
    /* if (MainInfo().pbdf != null) {
      List pages = MainInfo().pbdf['pages'];
      return pages.singleWhere((element) => element['id'] == pageId,
          orElse: () => null);
    }
    return null; */
  }

  /// Returns a [Map] that represents the PBDL screen with ID `screenId`
  /// inside `pbdlPage`'s screens property.
  Map getPbdlScreen(Map pbdlPage, String screenId) {
    /* if (MainInfo().pbdf != null) {
      List screens = pbdlPage['screens'];
      return screens.singleWhere((element) => element['id'] == screenId,
          orElse: () => null);
    }
    return null;*/
  }

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) {
    // TODO: implement createPBDLNode
    throw UnimplementedError();
  }
}
