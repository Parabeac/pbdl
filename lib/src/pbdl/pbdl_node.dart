import 'package:pbdl/src/pbdl/pb_style.dart';
import 'abstract_design_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_node.g.dart';

@JsonSerializable()
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

  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLNode.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLNodeToJson(this);

  factory PBDLNode.fromJson(Map<String, dynamic> json) =>
      AbstractDesignNodeFactory.getPBDLNode(json);

    
}
