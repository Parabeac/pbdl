import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
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
  String? imageReference;
  @override
  @JsonKey(ignore: true)
  Logger? log;

  @JsonKey(ignore: true)
  var fills;

  @override
  String? type = 'ELLIPSE';
  FigmaEllipse({
    String? name,
    bool? visible,
    String? type,
    pluginData,
    sharedPluginData,
    style,
    layoutAlign,
    FigmaConstraints? constraints,
    FigmaRect? boundaryRectangle,
    size,
    this.fills,
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
    imageReference = FigmaAssetProcessor().processImage(
      UUID,
      absoluteBoundingBox: absoluteBoundingBox,
      name: name!,
      effects: figmaStyleProperty?.effects ?? [],
    );
    return Future.value(PBDLImage(
      UUID: UUID,
      boundaryRectangle: absoluteBoundingBox!.interpretFrame(),
      isVisible: isVisible,
      name: name,
      style: figmaStyleProperty?.interpretStyle(),
      imageReference: imageReference,
      constraints: constraints?.interpret(),
      prototypeNodeUUID: transitionNodeID,
      layoutMainAxisSizing: getGrowSizing(layoutGrow),
      layoutCrossAxisSizing: getAlignSizing(layoutAlign),
    ));
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();
}
