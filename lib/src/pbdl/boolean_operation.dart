import 'package:pbdl/src/pbdl/pb_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';
import 'vector.dart';

part 'boolean_operation.g.dart';

@JsonSerializable()
class PBDLBooleanOperation extends PBDLVector implements PBDLNodeFactory {
  List<PBDLNode> children = [];

  String booleanOperation;

  @override
  String type;

  @override
  var boundaryRectangle;

  // TODO: do we need this for this class? Ivans
  String imageReference;

  @override
  String pbdfType = 'boolean_operation';

  @override
  String UUID;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBStyle style;

  @override
  bool isVisible;

  PBDLBooleanOperation({
    children,
    booleanOperation,
    type,
    style,
    PBDLFrame this.boundaryRectangle,
    String UUID,
    prototypeNodeUUID,
    transitionDuration,
    transitionEasing,
    imageReference,
  }) : super(
          style: style,
          UUID: UUID,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLBooleanOperation.fromJson(json);
  factory PBDLBooleanOperation.fromJson(Map<String, dynamic> json) =>
      _$BooleanOperationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanOperationToJson(this);
}
