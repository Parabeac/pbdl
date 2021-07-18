import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_vector.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLVector extends PBDLNode implements PBDLNodeFactory, PBDLImage {
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

  @override
  final type = 'vector';

  PBDLVector({
    this.name,
    visible,
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
    prototypeNodeUUID,
    transitionDuration,
    transitionEasing,
  }) : super(
          UUID,
          name,
          visible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLVector.fromJson(json);
  factory PBDLVector.fromJson(Map<String, dynamic> json) =>
      _$PBDLVectorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLVectorToJson(this);

  @override
  String UUID;

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;

  @override
  var boundaryRectangle;

  @override
  String imageReference;

  @override
  var image;
}
