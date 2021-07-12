import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'abstract_pbdl_node_factory.dart';
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
    this.prototypeNodeUUID, {
    transitionDuration,
    transitionEasing,
  });

  String pbdfType;
  String UUID;
  String name;
  bool isVisible;
  var boundaryRectangle;
  String type;
  PBDLStyle style;
  String prototypeNodeUUID;

  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLNode.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLNodeToJson(this);

  factory PBDLNode.fromJson(Map<String, dynamic> json) =>
      AbstractPBDLNodeFactory.getPBDLNode(json);
}
