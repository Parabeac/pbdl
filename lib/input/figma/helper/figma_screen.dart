import '../entities/abstract_figma_node_factory.dart';
import '../entities/layers/figma_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'figma_screen.g.dart';

@JsonSerializable()
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

  @override
  String pbdfType = 'screen';

  @override
  FigmaNode createDesignNode(Map<String, dynamic> json) {
    // var screen = FigmaScreen(name: json['name'], id: json['id']);
    // if (json.containsKey('designNode') && (json['convert'] ?? true)) {
    //   screen.figmaNode = FigmaNode.fromJson(json['designNode']);
    // }
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
  FigmaScreen createFigmaNode(Map<String, dynamic> json) =>
      FigmaScreen.fromJson(json);
}
