import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'boolean_operation.g.dart';

@JsonSerializable()
class PBDLBooleanOperation implements PBDLNodeFactory, PBDLNode {
  @override
  String pbdfType = 'boolean_operation';
  List<PBDLNode> children = [];

  @override
  var boundaryRectangle;

  PBDLBooleanOperation({
    booleanOperation,
    type,
    PBDLFrame this.boundaryRectangle,
    String UUID,
    String this.name,
    bool isVisible,
    pbdfType,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLBooleanOperation.fromJson(json);
  factory PBDLBooleanOperation.fromJson(Map<String, dynamic> json) =>
      _$BooleanOperationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanOperationToJson(this);

  @override
  String UUID;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;

  @override
  String type;

  @override
  bool isVisible;
}
