import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_figma_node_factory.dart';

part 'figma_node.g.dart';

@JsonSerializable(nullable: true)
class FigmaNode {
  @JsonKey(
    name: 'id',
  )
  String UUID;

  String name;

  String type;

  var pluginData;

  var sharedPluginData;

  FigmaRect absoluteBoundingBox;

  final FigmaConstraints constraints;

  FigmaNode child;

  String layoutAlign;

  num layoutGrow;

  @JsonKey(name: 'visible', defaultValue: true)
  bool isVisible;

  @JsonKey(name: 'transitionNodeID')
  String transitionNodeID;
  @JsonKey()
  num transitionDuration;
  @JsonKey()
  String transitionEasing;

  FigmaNode(
    this.name,
    this.isVisible,
    this.type,
    this.pluginData,
    this.sharedPluginData, {
    this.UUID,
    this.transitionNodeID,
    this.transitionDuration,
    this.transitionEasing,
    this.constraints,
    this.layoutAlign,
    this.layoutGrow,
  });

  Future<PBDLNode> interpretNode() async {
    return Future.value(PBDLNode(
      UUID,
      name,
      isVisible,
      null,
      null,
      transitionNodeID,
      child: await child.interpretNode(),
      constraints: constraints?.interpret(),
      layoutMainAxisSizing: getAlignSizing(layoutAlign),
      layoutCrossAxisSizing: getGrowSizing(layoutGrow),
    ));
  }

  ParentLayoutSizing getAlignSizing(String layoutAlign) {
    if (layoutAlign == 'INHERIT') {
      return ParentLayoutSizing.INHERIT;
    } else if (layoutAlign == 'STRETCH') {
      return ParentLayoutSizing.STRETCH;
    } else {
      return null;
    }
  }

  ParentLayoutSizing getGrowSizing(num layoutGrow) {
    if (layoutGrow == 0.0) {
      return ParentLayoutSizing.INHERIT;
    } else if (layoutGrow == 1.0) {
      return ParentLayoutSizing.STRETCH;
    } else {
      return null;
    }
  }

  factory FigmaNode.fromJson(Map<String, dynamic> json) =>
      AbstractFigmaNodeFactory.getFigmaNode(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaNodeToJson(this);
}
