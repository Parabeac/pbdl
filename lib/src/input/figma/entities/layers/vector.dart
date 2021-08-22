import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';

import '../abstract_figma_node_factory.dart';
import '../style/figma_style.dart';
import 'figma_node.dart';

part 'vector.g.dart';

@JsonSerializable()
class FigmaVector extends FigmaNode implements FigmaNodeFactory {
  @JsonKey(ignore: true)
  Logger log;

  FigmaStyle style;

  String layoutAlign;

  @override
  @JsonKey(name: 'absoluteBoundingBox')
  FigmaRect boundaryRectangle;

  var size;

  var strokes;

  double strokeWeight;

  String strokeAlign;

  var styles;
  @override
  String type = 'VECTOR';

  @JsonKey(name: 'fills')
  List fillsList;

  FigmaVector({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    this.style,
    this.layoutAlign,
    FigmaConstraints constraints,
    this.boundaryRectangle,
    this.size,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.styles,
    this.fillsList,
    String UUID,
    num transitionDuration,
    String transitionEasing,
    String transitionNodeID,
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
  Future<PBDLNode> interpretNode() {
    imageReference = FigmaAssetProcessor().processImage(UUID);
    return Future.value(PBDLImage(
        UUID: UUID,
        imageReference: imageReference,
        boundaryRectangle: boundaryRectangle?.interpretFrame(),
        isVisible: isVisible,
        name: name,
        style: style?.interpretStyle(),
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret()));
  }

  String imageReference;

  Map<String, dynamic> toPBDF() => toJson();
}
