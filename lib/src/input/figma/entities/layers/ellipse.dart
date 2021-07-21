import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';

import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'ellipse.g.dart';

@JsonSerializable()
class FigmaEllipse extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String imageReference;
  @override
  @JsonKey(ignore: true)
  Logger log;

  @JsonKey(ignore: true)
  var fills;

  @override
  String type = 'ELLIPSE';
  FigmaEllipse({
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
    this.fills,
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
          boundaryRectangle: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    log = Logger(runtimeType.toString());
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaEllipse.fromJson(json);
  factory FigmaEllipse.fromJson(Map<String, dynamic> json) =>
      _$FigmaEllipseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaEllipseToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    imageReference = FigmaAssetProcessor().processImage(UUID);
    return Future.value(PBDLImage(
      UUID: UUID,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isVisible: isVisible,
      name: name,
      style: style?.interpretStyle(),
      imageReference: imageReference,
      prototypeNodeUUID: transitionNodeID,
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
