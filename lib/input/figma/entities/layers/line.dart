import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/layers/vector.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:json_annotation/json_annotation.dart';
import 'figma_node.dart';

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
      FigmaFrame boundaryRectangle,
      size,
      fills,
      strokes,
      strokeWeight,
      strokeAlign,
      styles,
      String prototypeNodeUUID,
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
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'image';
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaLine.fromJson(json);
  factory FigmaLine.fromJson(Map<String, dynamic> json) =>
      _$FigmaLineFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaLineToJson(this);

  @override
  Future<PBIntermediateNode> interpretNode(PBContext currentContext) {
    return Future.value(InheritedContainer(
      this,
      Point(boundaryRectangle.x, boundaryRectangle.y),
      Point(
        boundaryRectangle.x + boundaryRectangle.width,
        boundaryRectangle.y + boundaryRectangle.height,
      ),
      name,
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'image';

  @override
  DesignNode createDesignNode(Map<String, dynamic> json) {
    // TODO: implement createDesignNode
    throw UnimplementedError();
  }

  @override
  DesignNode fromPBDF(Map<String, dynamic> json) {
    // TODO: implement fromPBDF
    throw UnimplementedError();
  }
}
