// maybe we dont need this one anymore, or we might use it for PBDL

import 'package:pbdl/input/helper/design_page.dart';
import 'package:pbdl/input/sketch/entities/style/shared_style.dart';

class DesignProject implements DesignNodeFactory {
  String projectName;
  bool debug = false;
  String id;
  @override
  String pbdfType = 'project';

  DesignProject({
    this.projectName,
    this.id,
  });

  List<DesignPage> pages = [];
  List<DesignPage> miscPages = [];
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

  @override
  DesignNode createDesignNode(Map<String, dynamic> json) {
    // TODO: implement createDesignNode
    throw UnimplementedError();
  }

  factory DesignProject.fromPBDF(Map<String, dynamic> json) {
    var project =
        DesignProject(projectName: json['projectName'], id: json['id']);
    if (json.containsKey('pages')) {
      (json['pages'] as List)?.forEach((value) {
        if (value != null) {
          project.pages.add(DesignPage.fromPBDF(value as Map<String, dynamic>));
        }
      });
    }
    return project;
  }

  /// Returns a [Map] that represents the PBDL page with ID `pageId`,
  /// or `null` if not found.
  Map getPbdlPage(String pageId) {
    if (MainInfo().pbdf != null) {
      List pages = MainInfo().pbdf['pages'];
      return pages.singleWhere((element) => element['id'] == pageId,
          orElse: () => null);
    }
    return null;
  }

  /// Returns a [Map] that represents the PBDL screen with ID `screenId`
  /// inside `pbdlPage`'s screens property.
  Map getPbdlScreen(Map pbdlPage, String screenId) {
    if (MainInfo().pbdf != null) {
      List screens = pbdlPage['screens'];
      return screens.singleWhere((element) => element['id'] == screenId,
          orElse: () => null);
    }
    return null;
  }
}
