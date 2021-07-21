import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';
import '../../helper/style_extractor.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'rectangle.g.dart';

@JsonSerializable()
class FigmaRectangle extends FigmaVector
    with PBColorMixin
    implements AbstractFigmaNodeFactory {
  @override
  String type = 'RECTANGLE';
  FigmaRectangle({
    String name,
    bool isVisible,
    type,
    pluginData,
    sharedPluginData,
    style,
    layoutAlign,
    constraints,
    boundaryRectangle,
    size,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    this.cornerRadius,
    this.rectangleCornerRadii,
    this.points,
    List fillsList,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name: name,
          visible: isVisible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          style: style,
          layoutAlign: layoutAlign,
          constraints: constraints,
          boundaryRectangle: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          fillsList: fillsList,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );

  List points;
  double cornerRadius;

  List<double> rectangleCornerRadii;

  @override
  @JsonKey(ignore: true)
  FigmaStyle style;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaRectangle.fromJson(json);
    node.style = StyleExtractor().getStyle(json);
    return node;
  }

  factory FigmaRectangle.fromJson(Map<String, dynamic> json) =>
      _$FigmaRectangleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaRectangleToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    var fillsMap =
        (fillsList == null || fillsList.isEmpty) ? {} : fillsList.first;
    if (fillsMap != null && fillsMap['type'] == 'IMAGE') {
      imageReference = FigmaAssetProcessor().processImage(UUID);

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
    return Future.value(PBDLRectangle(
      UUID: UUID,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isVisible: isVisible,
      name: name,
      style: style.interpretStyle(),
      child: await child?.interpretNode(),
      fixedRadius: cornerRadius ?? 0,
      prototypeNodeUUID: transitionNodeID,
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
