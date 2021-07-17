import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_boolean_operation.dart';
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
  Logger log;

  List<FigmaNode> children;

  String booleanOperation;

  @override
  String type = 'BOOLEAN_OPERATION';

  @override
  var boundaryRectangle;

  @override
  String imageReference;

  @override
  String pbdfType = 'boolean_operation';

  BooleanOperation({
    children,
    booleanOperation,
    type,
    style,
    boundaryRectangle,
    UUID,
    prototypeNodeUUID,
    transitionDuration,
    transitionEasing,
    imageReference,
  }) : super(
            style: style,
            UUID: UUID,
            prototypeNodeUUID: prototypeNodeUUID,
            transitionDuration: transitionDuration,
            transitionEasing: transitionEasing) {
    log = Logger(runtimeType.toString());
    pbdfType = 'boolean_operation';
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
    imageReference = FigmaAssetProcessor().processImage(UUID);
    return Future.value(PBDLBooleanOperation(
      children: children,
      booleanOperation: booleanOperation,
      type: type,
      style: style,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      UUID: UUID,
      prototypeNodeUUID: prototypeNodeUUID,
      transitionDuration: transitionDuration,
      transitionEasing: transitionEasing,
      imageReference: imageReference,
    ));
  }
}
