import 'package:pbdl/src/pbdl/pbdl_page.dart';
import 'package:quick_log/quick_log.dart';
import '../entities/abstract_figma_node_factory.dart';
import 'figma_screen.dart';

class FigmaPage {
  var log = Logger('FigmaPage');

  String id;
  String imageURI;
  String name;
  bool convert = true;
  List<FigmaScreen> screens = [];

  FigmaPage({
    this.name,
    this.id,
  }) {
    screens = [];
  }

  void addScreen(FigmaScreen item) {
    screens.add(item);
  }

  List<FigmaScreen> getPageItems() {
    log.info('We encountered a page that has ${screens.length} page items.');
    return screens;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};
    result['pbdfType'] = pbdfType;
    result['id'] = id;
    result['name'] = name;
    result['convert'] = convert;

    List<Map> tempScreens = [];
    for (var screen in screens) {
      tempScreens.add(screen.toJson());
    }
    result['screens'] = tempScreens;
    return result;
  }

  @override
  String pbdfType = 'design_page';

  factory FigmaPage.fromPBDF(Map<String, dynamic> json) {
    var page = FigmaPage(name: json['name'], id: json['id']);
    if (json.containsKey('screens')) {
      (json['screens'] as List)?.forEach((value) {
        if (value != null && (value['convert'] ?? true)) {
          page.screens.add(FigmaScreen.fromJson(value as Map<String, dynamic>));
        }
      });
    }
    return page;
  }

  @override
  String type;

  PBDLPage interpretNode() {
    return PBDLPage(
      name: name,
      id: id,
      screens: screens.map((e) => e.interpretNode()).toList(),
    );
  }
}
