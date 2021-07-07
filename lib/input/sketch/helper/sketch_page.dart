import 'package:quick_log/quick_log.dart';
import '../entities/abstract_sketch_node_factory.dart';
import '../entities/layers/sketch_node.dart';
import 'sketch_screen.dart';

class SketchPage implements SketchNodeFactory {
  var log = Logger('DesignPage');

  String id;
  String imageURI;
  String name;
  bool convert = true;
  List<SketchScreen> screens = [];

  SketchPage({
    this.name,
    this.id,
  }) {
    screens = [];
  }

  void addScreen(SketchScreen item) {
    screens.add(item);
  }

  List<SketchScreen> getPageItems() {
    log.info('We encountered a page that has ${screens.length} page items.');
    return screens;
  }

  /// Parabeac Design File
  Map<String, dynamic> toPBDF() {
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

  factory SketchPage.fromPBDF(Map<String, dynamic> json) {
    var page = SketchPage(name: json['name'], id: json['id']);
    if (json.containsKey('screens')) {
      (json['screens'] as List)?.forEach((value) {
        if (value != null && (value['convert'] ?? true)) {
          page.screens
              .add(SketchScreen.fromJson(value as Map<String, dynamic>));
        }
      });
    }
    return page;
  }

  @override
  String CLASS_NAME;

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) {
    // TODO: implement createSketchNode
    throw UnimplementedError();
  }
}
