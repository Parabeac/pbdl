import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_effect.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_stroke.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style_property.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_figma_node_factory.dart';

part 'figma_node.g.dart';

@JsonSerializable(nullable: true)
class FigmaNode extends FigmaBaseNode {
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

  @JsonKey(ignore: true)
  FigmaStyleProperty figmaStyleProperty;

  static Map figmaStylePropertyToJson(FigmaStyleProperty property) {
    var map = {};
    // TODO: implement
    return map;
  }

  static FigmaStyleProperty figmaStylePropertyFromJson(Map json) {
    var listFills = <FigmaFill>[];

    var listStrokes = <FigmaStroke>[];

    var listEffects = <FigmaEffect>[];

    for (var fill in json['fills']) {
      listFills.add(FigmaFill.fromJson(fill));
    }

    for (var stroke in json['strokes']) {
      listStrokes.add(FigmaStroke.fromJson(stroke));
    }

    for (var effect in json['effects']) {
      listEffects.add(FigmaEffect.fromJson(effect));
    }

    var property = FigmaStyleProperty(listFills, listStrokes, listEffects);

    return property;
  }

  @override
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
      layoutMainAxisSizing: getGrowSizing(layoutGrow),
      layoutCrossAxisSizing: getAlignSizing(layoutAlign),
    ));
  }

  ParentLayoutSizing getAlignSizing(String layoutAlign) {
    if (layoutAlign == 'STRETCH') {
      return ParentLayoutSizing.STRETCH;
    } else {
      return ParentLayoutSizing.INHERIT;
    }
  }

  ParentLayoutSizing getGrowSizing(num layoutGrow) {
    if (layoutGrow == 0.0) {
      return ParentLayoutSizing.INHERIT;
    } else if (layoutGrow == 1.0) {
      return ParentLayoutSizing.STRETCH;
    } else {
      return ParentLayoutSizing.INHERIT;
    }
  }

  factory FigmaNode.fromJson(Map<String, dynamic> json) {
    return AbstractFigmaNodeFactory.getFigmaNode(json)
      ..figmaStyleProperty = figmaStylePropertyFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$FigmaNodeToJson(this);
}
