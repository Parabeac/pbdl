import 'package:pbdl/pbdl/pb_style.dart';

import 'abstract_design_node_factory.dart';

class PBDLNode {
  PBDLNode(
    this.UUID,
    this.name,
    this.isVisible,
    this.boundaryRectangle,
    this.type,
    this.style,
    this.prototypeNodeUUID,
  );

  String pbdfType;
  String UUID;
  String name;
  bool isVisible;
  var boundaryRectangle;
  String type;
  PBStyle style;
  String prototypeNodeUUID;

  toJson() {}

  Future<PBDLNode> interpretNode() {}

  // Map<String, dynamic> toPBDF() {}

  // factory PBDLNode.fromPBDF(Map<String, dynamic> json) =>
  //     AbstractDesignNodeFactory.getDesignNode(json);

  factory PBDLNode.fromJson(Map<String, dynamic> json) =>
      AbstractDesignNodeFactory.getPBDLNode(json);
}
