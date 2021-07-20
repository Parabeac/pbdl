import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'figma_frame.dart';
import 'vector.dart';

part 'line.g.dart';

@JsonSerializable()
class FigmaLine extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String type = 'LINE';
  FigmaLine(
      {String name,
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
      String transitionEasing})
      : super(
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
      FigmaLine.fromJson(json);
  factory FigmaLine.fromJson(Map<String, dynamic> json) =>
      _$FigmaLineFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaLineToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    return Future.value(PBDLRectangle(
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
