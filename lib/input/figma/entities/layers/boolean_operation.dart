
import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/vector.dart';
import 'package:pbdl/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';

import 'figma_node.dart';

part 'boolean_operation.g.dart';

@JsonSerializable(nullable: true)
class BooleanOperation extends FigmaVector
    implements FigmaNodeFactory, GroupNode, Image {
  @JsonKey(ignore: true)
  Logger log;
  @override
  List children;
  String booleanOperation;

  @override
  String type = 'BOOLEAN_OPERATION';

  @override
  var boundaryRectangle;

  BooleanOperation({
    List<FigmaNode> this.children,
    booleanOperation,
    type,
    FigmaStyle style,
    Frame this.boundaryRectangle,
    String UUID,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
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
  Future<PBIntermediateNode> interpretNode(PBContext currentContext) async {
    imageReference = FigmaAssetProcessor().processImage(UUID);

    return Future.value(
        InheritedBitmap(this, name, currentContext: currentContext));
  }

  @override
  String imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'boolean_operation';
}
