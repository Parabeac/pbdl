import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_constraints.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'regular_polygon.g.dart';

@JsonSerializable()
class FigmaRegularPolygon extends FigmaVector
    implements AbstractFigmaNodeFactory {
  @override
  String? type = 'REGULAR_POLYGON';
  FigmaRegularPolygon({
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
          absoluteBoundingBox: boundaryRectangle == null
              ? null
              : FigmaRect.fromJson(boundaryRectangle),
          size: size,
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
    imageReference = FigmaAssetProcessor().processImage(
      UUID,
      absoluteBoundingBox: absoluteBoundingBox,
      name: name!,
      format: IMAGE_FORMAT.SVG,
      effects: figmaStyleProperty?.effects ?? [],
    );
    return Future.value(PBDLImage(
      imageReference: imageReference,
      UUID: UUID,
      boundaryRectangle: absoluteBoundingBox!.interpretFrame(),
      isVisible: isVisible,
      name: name,
      prototypeNodeUUID: transitionNodeID,
      constraints: constraints?.interpret(),
      layoutMainAxisSizing: getGrowSizing(layoutGrow),
      layoutCrossAxisSizing: getAlignSizing(layoutAlign),
    ));
  }

  @override
  String? imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
