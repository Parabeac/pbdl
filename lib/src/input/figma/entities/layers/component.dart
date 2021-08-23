import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type_factory.dart';
import 'package:pbdl/src/input/figma/helper/style_extractor.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_master_node.dart';

import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_constraints.dart';
import 'figma_node.dart';
import 'figma_frame.dart';

part 'component.g.dart';

@JsonSerializable()
class Component extends FigmaFrame implements AbstractFigmaNodeFactory {
  /// Map that keeps track of override properties repeated names.
  @JsonKey(ignore: true)
  var repeatNames = <String, int>{};
  @override
  String type = 'COMPONENT';
  Component({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    boundaryRectangle,
    style,
    fills,
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
  }) : super(
          name: name,
          isVisible: isVisible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          absoluteBoundingBox: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
          style: style,
          fills: fills,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          cornerRadius: cornerRadius,
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
    var component = Component.fromJson(json);

    component.style = StyleExtractor().getStyle(json);

    return component;
  }

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
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

    return PBDLSharedMasterNode(
        UUID: UUID,
        overrideProperties: props,
        name: name,
        isVisible: isVisible,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        style: style.interpretStyle(),
        prototypeNodeUUID: transitionNodeID,
        symbolID: UUID,
        resizingConstraint: constraints?.interpret(),
        isFlowHome: isFlowHome,
        children: await Future.wait(
            children.map((e) async => await e.interpretNode()).toList()));
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
        } else {
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

      if (current.child != null) {
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
