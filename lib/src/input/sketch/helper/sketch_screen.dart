import 'package:pbdl/src/pbdl/pbdl_screen.dart';

import '../entities/abstract_sketch_node_factory.dart';
import '../entities/layers/sketch_node.dart';

class SketchScreen {
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

  @override
  String pbdfType = 'screen';

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

  Future<PBDLScreen> interpretNode() async {
    return Future.value(PBDLScreen(
      designNode: await designNode.interpretNode(),
      id: id,
      name: name,
      type: type,
    ));
  }
}
