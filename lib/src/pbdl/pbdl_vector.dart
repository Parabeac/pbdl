import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_vector.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLVector extends PBDLNode implements PBDLNodeFactory, PBDLImage {
  var layoutAlign;

  var size;

  var strokes;

  var strokeWeight;

  var strokeAlign;

  var styles;

  var fillsList;

  @override
  final type = 'vector';

  PBDLVector({
    String name,
    visible,
    pluginData,
    sharedPluginData,
    this.layoutAlign,
    PBDLConstraints constraints,
    PBDLBoundaryBox boundaryRectangle,
    this.size,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.styles,
    this.fillsList,
    String UUID,
    PBDLStyle style,
    prototypeNodeUUID,
    transitionDuration,
    transitionEasing,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
  }) : super(
          UUID,
          name,
          visible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          constraints: constraints,
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLVector.fromJson(json);
  factory PBDLVector.fromJson(Map<String, dynamic> json) =>
      _$PBDLVectorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLVectorToJson(this);

  @override
  String imageReference;

  @override
  var image;
}
