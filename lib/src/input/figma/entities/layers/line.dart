import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_border.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_constraints.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'line.g.dart';

@JsonSerializable()
class FigmaLine extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String type = 'LINE';
  FigmaLine({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    layoutAlign,
    FigmaConstraints constraints,
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
          layoutAlign: layoutAlign,
          constraints: constraints,
          absoluteBoundingBox: boundaryRectangle,
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
  factory FigmaLine.fromJson(Map<String, dynamic> json) {
    return _$FigmaLineFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$FigmaLineToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    var tempStyle = fillsList.isNotEmpty
        ? FigmaStyle(
            fills: [FigmaFill.fromJson(fillsList[0])], borders: [FigmaBorder()])
        : FigmaStyle(fills: [
            FigmaFill.fromJson({
              'isEnabled': true,
              'color': {
                'a': 1.0,
                'r': 0.0,
                'g': 0.0,
                'b': 0.0,
              }
            })
          ], borders: [
            FigmaBorder()
          ]);
    absoluteBoundingBox.height = strokeWeight;
    return Future.value(PBDLRectangle(
        style: tempStyle?.interpretStyle(),
        UUID: UUID,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret()));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
