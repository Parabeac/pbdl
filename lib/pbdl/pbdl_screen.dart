// maybe we dont need this one anymore, or we might use it for PBDL

import 'package:pbdl/pbdl/abstract_design_node_factory.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

class PBDLScreen implements PBDLNodeFactory {
  String id;
  String name;
  bool convert = true;
  String imageURI;
  String type;
  PBDLNode designNode;

  // Do we still need this?
  // DesignPage parentPage;

  PBDLScreen({
    PBDLNode designNode,
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
  PBDLNode createDesignNode(Map<String, dynamic> json) {
    var screen = PBDLScreen(name: json['name'], id: json['id']);
    if (json.containsKey('designNode') && (json['convert'] ?? true)) {
      screen.designNode = PBDLNode.fromJson(json['designNode']);
    }
    // return screen;
    throw UnimplementedError();
  }

  factory PBDLScreen.fromPBDF(Map<String, dynamic> json) {
    var screen = PBDLScreen(name: json['name'], id: json['id']);
    if (json.containsKey('designNode') && (json['convert'] ?? true)) {
      screen.designNode = PBDLNode.fromJson(json['designNode']);
    }
    return screen;
  }
  Map<String, Object> toJson() {
    var result = <String, Object>{'azure_blob_uri': imageURI};
    result.addAll(designNode.toJson());
    return result;
  }

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) {
    // TODO: implement createPBDLNode
    throw UnimplementedError();
  }
}
