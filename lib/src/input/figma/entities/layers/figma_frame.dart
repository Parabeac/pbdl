import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_artboard.dart';
import 'package:pbdl/src/pbdl/pbdl_group_node.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../../helper/style_extractor.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';

part 'figma_frame.g.dart';

@JsonSerializable(explicitToJson: true)
class FigmaFrame extends FigmaChildrenNode
    with PBColorMixin
    implements FigmaNodeFactory {
  @JsonKey(name: 'absoluteBoundingBox')
  @override
  FigmaRect boundaryRectangle;

  @JsonKey(ignore: true)
  FigmaStyle style;

  @JsonKey(ignore: true)
  var fills;

  var strokes;

  double strokeWeight;

  String strokeAlign;

  double cornerRadius;


  String layoutAlign;

  var size;

  double horizontalPadding;

  double verticalPadding;

  double itemSpacing;

  FigmaColor backgroundColor;

  @override
  String type = 'FRAME';

  @JsonKey(ignore: true)
  bool isScaffold = false;

  @JsonKey(defaultValue: false)
  var isFlowHome = false;

  FigmaFrame({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    this.boundaryRectangle,
    this.style,
    this.fills,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.cornerRadius,
    FigmaConstraints constraints,
    this.layoutAlign,
    this.size,
    this.horizontalPadding,
    this.verticalPadding,
    this.itemSpacing,
    List<FigmaNode> children,
    String UUID,
    this.backgroundColor,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name,
          isVisible,
          type,
          pluginData,
          sharedPluginData,
          UUID: UUID,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          children: children,
          constraints: constraints
        );
  @JsonKey(ignore: true)
  List points;

  @JsonKey(name: 'fills')
  List fillsList;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaFrame.fromJson(json);
    node.style = StyleExtractor().getStyle(json);
    return node;
  }

  factory FigmaFrame.fromJson(Map<String, dynamic> json) =>
      _$FigmaFrameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaFrameToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    if (isScaffold) {
      return Future.value(
        PBDLArtboard(
            backgroundColor: backgroundColor.interpretColor(),
            isFlowHome: false,
            UUID: UUID,
            boundaryRectangle: boundaryRectangle.interpretFrame(),
            isVisible: isVisible,
            name: name,
            style: style.interpretStyle(),
            prototypeNodeUUID: transitionNodeID,
            constraints: constraints?.interpret(),
            children: await Future.wait(
                children.map((e) async => await e.interpretNode()).toList())),
      );
    } else {
      return Future.value(
        PBDLGroupNode(
            UUID: UUID,
            boundaryRectangle: boundaryRectangle.interpretFrame(),
            isVisible: isVisible,
            name: name,
            style: style.interpretStyle(),
            prototypeNodeUUID: transitionNodeID,
            constraints: constraints?.interpret(),
            children: await Future.wait(
                children.map((e) async => await e.interpretNode()).toList())),
      );
    }
  }

  String imageReference;

  Map<String, dynamic> toPBDF() => toJson();
}
