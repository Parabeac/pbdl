import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/helper/component_cache_service.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type_factory.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_component_property_definition.dart';
import 'package:pbdl/src/input/figma/helper/properties/references/figma_component_property_reference.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_constraints.dart';
import 'figma_node.dart';
import 'figma_frame.dart';
import 'instance.dart';

part 'component.g.dart';

@JsonSerializable()
class Component extends FigmaFrame implements AbstractFigmaNodeFactory {
  /// Map that keeps track of override properties repeated names.
  @JsonKey(ignore: true)
  var repeatNames = <String, int>{};
  @override
  String type = 'COMPONENT';

  String componentSetId;

  String componentSetName;

  Map<String, ComponentPropertyDefinition> componentPropertyDefinitions;

  Component({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    boundaryRectangle,
    style,
    strokes,
    strokeWeight,
    strokeAlign,
    cornerRadius,
    FigmaConstraints constraints,
    layoutAlign,
    size,
    horizontalPadding,
    verticalPadding,
    itemSpacing,
    List<FigmaNode> children,
    FigmaColor backgroundColor,
    this.symbolID,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
    this.componentSetId,
    this.componentSetName,
    this.componentPropertyDefinitions,
  }) : super(
          name: name,
          isVisible: isVisible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          absoluteBoundingBox: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
          constraints: constraints,
          layoutAlign: layoutAlign,
          size: size,
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding,
          itemSpacing: itemSpacing,
          children: children,
          backgroundColor: backgroundColor,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var component = Component.fromJson(json)
      ..figmaStyleProperty = FigmaNode.figmaStylePropertyFromJson(json);

    return component;
  }

  factory Component.fromJson(Map<String, dynamic> json) {
    /// Save component ID to the cache
    if (json['id'] != null) {
      ComponentCacheService().localComponents[json['id']] = json;
    }
    return _$ComponentFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$ComponentToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    /// Create Overidable Properties.
    var props = <PBDLOverrideProperty>[];

    for (var child in children) {
      var currProps = await _traverseChildrenForOverrides(child)
        ..removeWhere((element) => element.value == null);
      props.addAll(currProps);
    }

    var tempPropertyDefinitions;
    // TODO: add it to the constructor
    if (componentPropertyDefinitions != null) {
      tempPropertyDefinitions = componentPropertyDefinitions.values
          .map((value) => value.toPBDL())
          .toList();
    }

    return PBDLSharedMasterNode(
      UUID: UUID,
      overrideProperties: props,
      name: name,
      isVisible: isVisible,
      boundaryRectangle: absoluteBoundingBox.interpretFrame(),
      style: figmaStyleProperty.interpretStyle(),
      prototypeNodeUUID: transitionNodeID,
      symbolID: UUID,
      constraints: isRoot
          ? PBDLConstraints.defaultConstraints()
          : constraints?.interpret(),
      isFlowHome: isFlowHome,
      layoutMainAxisSizing: getGrowSizing(layoutGrow),
      layoutCrossAxisSizing: getAlignSizing(layoutAlign),
      children: await Future.wait(
          children.map((e) async => await e.interpretNode()).toList()),
      sharedNodeSetID: componentSetId,
      componentSetName: componentSetName,
      masterPropertyDefinition: tempPropertyDefinitions,
    );
  }

  Future<List<PBDLOverrideProperty>> _traverseChildrenForOverrides(
      FigmaNode root) async {
    var stack = [root];
    var values = <PBDLOverrideProperty>[];
    while (stack.isNotEmpty) {
      var current = stack.removeLast();

      // Checks if `current` node should be an override property
      var override = FigmaOverrideTypeFactory.getType(current);

      if (override != null) {
        // Check `current.name` for name collisions
        if (repeatNames.containsKey(current.name)) {
          repeatNames[current.name]++;

          current.name =
              '${current.name}${repeatNames[current.name].toString()}';
        } else if (current is! Instance) {
          repeatNames[current.name] = 1;
        }

        var overrideProp = PBDLOverrideProperty(
          current.UUID,
          current.name,
          override.getPBDLType(),
          await override.getProperty(current),
        )..constraints = current.constraints?.interpret();
        values.add(overrideProp);
      }

      // We do not want to process children of instance as override properties
      // since Instances have their own overrides
      if (current is Instance) {
        continue;
      } else if (current.child != null) {
        stack.add(current.child);
      } else if (current is FigmaChildrenNode && current.children != null) {
        current.children.forEach(stack.add);
      }
    }
    return Future.value(values);
  }

  String symbolID;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  var isFlowHome;
}
