import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vector.g.dart';

@JsonSerializable()
class Vector implements PBDLNodeFactory, PBDLNode, PBDLImage {
  @override
  String pbdfType = 'vector';

  var layoutAlign;

  var constraints;

  var size;

  var strokes;

  var strokeWeight;

  var strokeAlign;

  var styles;

  var fillsList;

  Vector({
    this.name,
    visible,
    this.type,
    pluginData,
    sharedPluginData,
    this.layoutAlign,
    this.constraints,
    PBDLFrame this.boundaryRectangle,
    this.size,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.styles,
    this.fillsList,
    this.UUID,
    this.pbdfType = 'vector',
    this.style,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => Vector.fromJson(json);
  factory Vector.fromJson(Map<String, dynamic> json) => _$VectorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$VectorToJson(this);

  @override
  String UUID;

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBStyle style;

  @override
  String type;

  @override
  var boundaryRectangle;

  @override
  String imageReference;
}
