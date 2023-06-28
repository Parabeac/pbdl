import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'vector.dart';

part 'boolean_operation.g.dart';

@JsonSerializable()
class BooleanOperation extends FigmaVector implements FigmaNodeFactory {
  @override
  @JsonKey(ignore: true)
  Logger? log;

  List<FigmaNode>? children;

  String? booleanOperation;

  @override
  final String type = 'BOOLEAN_OPERATION';

  @override
  FigmaRect? absoluteBoundingBox;

  @override
  String? imageReference;

  BooleanOperation({
    this.children,
    this.booleanOperation,
    style,
    this.absoluteBoundingBox,
    UUID,
    String? transitionNodeID,
    transitionDuration,
    transitionEasing,
    imageReference,
  }) : super(
          UUID: UUID,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    log = Logger(runtimeType.toString());
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      BooleanOperation.fromJson(json);
  factory BooleanOperation.fromJson(Map<String, dynamic> json) =>
      _$BooleanOperationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanOperationToJson(this);

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
      boundaryRectangle: absoluteBoundingBox?.interpretFrame(),
      isVisible: isVisible,
      name: name,
      style: figmaStyleProperty?.interpretStyle(),
      booleanOperation: booleanOperation,
      prototypeNodeUUID: transitionNodeID,
      imageReference: imageReference,
      constraints: constraints?.interpret(),
      layoutMainAxisSizing: getGrowSizing(layoutGrow),
      layoutCrossAxisSizing: getAlignSizing(layoutAlign),
    ));
  }
}
