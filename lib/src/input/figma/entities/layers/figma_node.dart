import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_effect.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_stroke.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style_property.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_holder.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/properties/references/figma_component_property_reference.dart';
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

  @JsonKey()
  ComponentPropertyReference componentPropertyReferences;

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
    this.componentPropertyReferences,
  });

  @JsonKey(ignore: true)
  FigmaStyleProperty figmaStyleProperty;

  Map figmaStylePropertyToJson(FigmaStyleProperty property) {
    return figmaStyleProperty.toJson();
  }

  static FigmaStyleProperty figmaStylePropertyFromJson(Map json) {
    var listFills = <FigmaFill>[];

    var listEffects = <FigmaEffect>[];

    for (var fill in json['fills']) {
      listFills.add(FigmaFill.fromJson(fill));
    }

    var figmaStroke = FigmaStroke.fromJson(json);

    for (var effect in json['effects']) {
      listEffects.add(FigmaEffect.fromJson(effect));
    }

    var property = FigmaStyleProperty(
        fills: listFills,
        stroke: figmaStroke,
        effects: listEffects,
        clipsContent: json['clipsContent']);

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

  /// Applicable for auto-layout frames. Determines how the frame will
  /// grow on the parent's [counter axis].
  ///
  /// https://www.figma.com/plugin-docs/api/properties/nodes-layoutalign/
  ParentLayoutSizing getAlignSizing(String layoutAlign) {
    if (layoutAlign == 'STRETCH') {
      return ParentLayoutSizing.STRETCH;
    } else if (layoutAlign == 'INHERIT') {
      return ParentLayoutSizing.INHERIT;
    } else {
      return ParentLayoutSizing.NONE;
    }
  }

  /// Applicable for auto-layout frames. Determines how the frame will
  /// grow on the parent's [main axis].
  ///
  /// https://www.figma.com/plugin-docs/api/properties/nodes-layoutgrow/
  ParentLayoutSizing getGrowSizing(num layoutGrow) {
    if (layoutGrow == 0.0) {
      return ParentLayoutSizing.INHERIT;
    } else if (layoutGrow == 1.0) {
      return ParentLayoutSizing.STRETCH;
    } else {
      return ParentLayoutSizing.NONE;
    }
  }

  factory FigmaNode.fromJson(Map<String, dynamic> json) {
    return AbstractFigmaNodeFactory.getFigmaNode(json)
      ..figmaStyleProperty = figmaStylePropertyFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$FigmaNodeToJson(this);
}
