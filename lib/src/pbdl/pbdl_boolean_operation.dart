import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_vector.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_boolean_operation.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLBooleanOperation extends PBDLVector
    implements PBDLNodeFactory, PBDLNode {
  @override
  String pbdfType = 'boolean_operation';
  List<PBDLNode> children = [];

  String booleanOperation;

  @override
  String type;

  @override
  var boundaryRectangle;

  // TODO: do we need this for this class? Ivans
  @override
  String imageReference;

  @override
  String UUID;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;

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
      _$PBDLBooleanOperationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLBooleanOperationToJson(this);

  @override
  var image;
}
