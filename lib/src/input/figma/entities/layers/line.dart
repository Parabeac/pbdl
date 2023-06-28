import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_constraints.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'line.g.dart';

@JsonSerializable()
class FigmaLine extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String? type = 'LINE';
  FigmaLine({
    String? name,
    bool? visible,
    String? type,
    pluginData,
    sharedPluginData,
    layoutAlign,
    FigmaConstraints? constraints,
    boundaryRectangle,
    size,
    styles,
    String? transitionNodeID,
    num? transitionDuration,
    String? transitionEasing,
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
    if (absoluteBoundingBox!.width == 0.0) {
      absoluteBoundingBox!.width = strokeWeight;
      absoluteBoundingBox!.x = absoluteBoundingBox!.x! - strokeWeight!;
    }
    if (absoluteBoundingBox!.height == 0.0) {
      absoluteBoundingBox!.height = strokeWeight;
      absoluteBoundingBox!.y = absoluteBoundingBox!.y! - strokeWeight!;
    }

    imageReference = FigmaAssetProcessor().processImage(
      UUID,
      absoluteBoundingBox: absoluteBoundingBox,
      name: name!,
      format: IMAGE_FORMAT.SVG,
      effects: figmaStyleProperty?.effects ?? [],
    );

    return Future.value(PBDLImage(
      UUID: UUID,
      imageReference: imageReference,
      boundaryRectangle: absoluteBoundingBox?.interpretFrame(),
      isVisible: isVisible,
      name: name,
      style: figmaStyleProperty?.interpretStyle(),
      prototypeNodeUUID: transitionNodeID,
      constraints: constraints?.interpret(),
      layoutMainAxisSizing: getGrowSizing(layoutGrow),
      layoutCrossAxisSizing: getAlignSizing(layoutAlign),
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
