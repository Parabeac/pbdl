import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';

import '../../../../../pbdl.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';

part 'vector.g.dart';

@JsonSerializable()
class FigmaVector extends FigmaNode implements FigmaNodeFactory {
  @JsonKey(ignore: true)
  Logger log;

  @override
  @JsonKey()
  FigmaRect absoluteBoundingBox;

  var size;

  var strokes;

  double strokeWeight;

  String strokeAlign;

  var styles;

  @override
  String type = 'VECTOR';

  FigmaVector({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    FigmaConstraints constraints,
    this.absoluteBoundingBox,
    this.size,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.styles,
    String UUID,
    num transitionDuration,
    String transitionEasing,
    String transitionNodeID,
    layoutAlign,
    layoutGrow,
  }) : super(
          name,
          visible,
          type,
          pluginData,
          sharedPluginData,
          UUID: UUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          transitionNodeID: transitionNodeID,
          constraints: constraints,
          layoutAlign: layoutAlign,
          layoutGrow: layoutGrow,
        ) {
    log = Logger(runtimeType.toString());
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaVector.fromJson(json);
  factory FigmaVector.fromJson(Map<String, dynamic> json) =>
      _$FigmaVectorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaVectorToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    if (figmaStyleProperty.fills.first.type
        .toLowerCase()
        .contains('gradient')) {
      return Future.value(
        PBDLRectangle(
          UUID: UUID,
          boundaryRectangle: absoluteBoundingBox.interpretFrame(),
          isVisible: isVisible,
          name: name,
          style: figmaStyleProperty.interpretStyle(),
          child: await child?.interpretNode(),
          fixedRadius: figmaStyleProperty.stroke.cornerRadius,
          prototypeNodeUUID: transitionNodeID,
          constraints: constraints?.interpret(),
          layoutMainAxisSizing: getGrowSizing(layoutGrow),
          layoutCrossAxisSizing: getAlignSizing(layoutAlign),
        ),
      );
    }

    imageReference =
        FigmaAssetProcessor().processImage(UUID, absoluteBoundingBox);

    if (absoluteBoundingBox != null) {
      if (absoluteBoundingBox.height == 0.0) {
        absoluteBoundingBox.height = strokeWeight;
      }
      if (absoluteBoundingBox.width == 0.0) {
        absoluteBoundingBox.width = strokeWeight;
      }
    }

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

  String imageReference;

  Map<String, dynamic> toPBDF() => toJson();
}
