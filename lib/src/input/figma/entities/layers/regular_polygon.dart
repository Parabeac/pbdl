import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'regular_polygon.g.dart';

@JsonSerializable()
class FigmaRegularPolygon extends FigmaVector
    implements AbstractFigmaNodeFactory {
  @override
  String type = 'REGULAR_POLYGON';
  FigmaRegularPolygon({
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
      FigmaRegularPolygon.fromJson(json);
  factory FigmaRegularPolygon.fromJson(Map<String, dynamic> json) =>
      _$FigmaRegularPolygonFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaRegularPolygonToJson(this);

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
      constraints: constraints?.interpret()
    ));
  }

  @override
  String imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
