import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'star.g.dart';

@JsonSerializable()
class FigmaStar extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String type = 'STAR';
  FigmaStar({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    style,
    layoutAlign,
    constraints,
    boundaryRectangle,
    size,
    fills,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name: name,
          visible: visible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          style: style,
          layoutAlign: layoutAlign,
          constraints: constraints,
          boundaryRectangle: boundaryRectangle,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );
  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaStar.fromJson(json);
  factory FigmaStar.fromJson(Map<String, dynamic> json) =>
      _$FigmaStarFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaStarToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    return Future.value(PBDLImage(
      imageReference: imageReference,
      UUID: UUID,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isVisible: isVisible,
      name: name,
      style: style.interpretStyle(),
      prototypeNodeUUID: transitionNodeID,
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
