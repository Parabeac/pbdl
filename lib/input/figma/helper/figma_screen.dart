import '../entities/abstract_figma_node_factory.dart';
import '../entities/layers/figma_node.dart';

class FigmaScreen implements FigmaNodeFactory {
  String id;
  String name;
  bool convert = true;
  String imageURI;
  String type;
  FigmaNode figmaNode;

  // Do we still need this?
  // DesignPage parentPage;

  FigmaScreen({
    this.figmaNode,
    this.id,
    this.name,
    this.type,
  });

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
    result['designNode'] = figmaNode.toJson();
    result['azure_blob_uri'] = imageURI;
    return result;
  }

  @override
  String pbdfType = 'screen';

  @override
  FigmaNode createDesignNode(Map<String, dynamic> json) {
    var screen = FigmaScreen(name: json['name'], id: json['id']);
    if (json.containsKey('designNode') && (json['convert'] ?? true)) {
      screen.figmaNode = FigmaNode.fromJson(json['designNode']);
    }
    // return screen;
    throw UnimplementedError();
  }

  factory FigmaScreen.fromJson(Map<String, dynamic> json) {
    var screen = FigmaScreen(name: json['name'], id: json['id']);
    if (json.containsKey('designNode') && (json['convert'] ?? true)) {
      screen.figmaNode = FigmaNode.fromJson(json['designNode']);
    }
    return screen;
  }
  Map<String, Object> toJson() {
    var result = <String, Object>{'azure_blob_uri': imageURI};
    result.addAll(figmaNode.toJson());
    return result;
  }

  @override
  FigmaNode createPBDLNode(Map<String, dynamic> json) {
    // TODO: implement createPBDLNode
    throw UnimplementedError();
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    // TODO: implement createFigmaNode
    throw UnimplementedError();
  }
}
