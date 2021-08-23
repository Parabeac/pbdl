import 'package:pbdl/src/pbdl/pbdl_screen.dart';

import '../entities/layers/figma_node.dart';

class FigmaScreen {
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

  Future<PBDLScreen> interpretNode() async {
    return PBDLScreen(
      designNode: await figmaNode?.interpretNode(),
      UUID: id,
      name: name,
    );
  }
}
