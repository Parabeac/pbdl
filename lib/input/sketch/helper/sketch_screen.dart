import '../entities/abstract_sketch_node_factory.dart';
import '../entities/layers/sketch_node.dart';

class SketchScreen implements SketchNodeFactory {
  String id;
  String name;
  bool convert = true;
  String imageURI;
  String type;
  SketchNode designNode;

  // Do we still need this?
  // DesignPage parentPage;

  SketchScreen({
    SketchNode designNode,
    this.id,
    this.name,
    this.type,
  }) {
    this.designNode = designNode;
  }

  Map<String, dynamic> toPBDF() {
    var result = <String, Object>{};
    if (this.type == 'symbolMaster') {
      result['pbdfType'] = 'symbol_master';
    } else {
      result['pbdfType'] = pbdfType;
    }
    result['id'] = id;
    result['name'] = name;
    result['convert'] = convert;
    result['type'] = type;
    result['designNode'] = designNode.toJson();
    result['azure_blob_uri'] = imageURI;
    return result;
  }

  @override
  String pbdfType = 'screen';

  @override
  SketchNode createDesignNode(Map<String, dynamic> json) {
    var screen = SketchScreen(name: json['name'], id: json['id']);
    if (json.containsKey('designNode') && (json['convert'] ?? true)) {
      screen.designNode = SketchNode.fromJson(json['designNode']);
    }
    // return screen;
    throw UnimplementedError();
  }

  factory SketchScreen.fromJson(Map<String, dynamic> json) {
    var screen = SketchScreen(name: json['name'], id: json['id']);
    if (json.containsKey('designNode') && (json['convert'] ?? true)) {
      screen.designNode = SketchNode.fromJson(json['designNode']);
    }
    return screen;
  }
  Map<String, Object> toJson() {
    var result = <String, Object>{'azure_blob_uri': imageURI};
    result.addAll(designNode.toJson());
    return result;
  }

  @override
  String CLASS_NAME;

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) {
    // TODO: implement createSketchNode
    throw UnimplementedError();
  }
}
