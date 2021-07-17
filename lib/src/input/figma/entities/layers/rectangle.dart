import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';
import '../../helper/style_extractor.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'frame.dart';
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
    FigmaFrame boundaryRectangle,
    size,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    this.cornerRadius,
    this.rectangleCornerRadii,
    this.points,
    List fillsList,
    String prototypeNodeUUID,
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
          boundaryRectangle: boundaryRectangle,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          fillsList: fillsList,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'rectangle';
    var fillsMap =
        (fillsList == null || fillsList.isEmpty) ? {} : fillsList.first;
    if (fillsMap != null && fillsMap['type'] == 'IMAGE') {
      pbdfType = 'image';
    }
  }

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
        boundaryRectangle: PBDLFrame.fromJson(boundaryRectangle),
        isVisible: isVisible,
        name: name,
        pbdfType: pbdfType,
        style: style.interpretStyle(),
      ));
    }
    // FigmaBorder border;
    // for (var b in style?.borders?.reversed ?? []) {
    //   if (b.isEnabled) {
    //     border = b;
    //   }
    // }
    return Future.value(PBDLRectangle(
      UUID: UUID,
      boundaryRectangle: PBDLFrame.fromJson(boundaryRectangle),
      isVisible: isVisible,
      name: name,
      type: type,
      pbdfType: pbdfType,
      style: style.interpretStyle(),
      child: await child.interpretNode(),
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'rectangle';
}
