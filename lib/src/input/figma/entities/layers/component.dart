import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_master_node.dart';

import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'figma_frame.dart';

part 'component.g.dart';

@JsonSerializable()
class Component extends FigmaFrame implements AbstractFigmaNodeFactory {
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
    constraints,
    layoutAlign,
    size,
    horizontalPadding,
    verticalPadding,
    itemSpacing,
    List<FigmaNode> children,
    FigmaColor backgroundColor,
    this.symbolID,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name: name,
          isVisible: isVisible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          boundaryRectangle: boundaryRectangle != null
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
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        );

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      Component.fromJson(json);
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ComponentToJson(this);

  // List<PBSharedParameterProp> _extractParameters() {
  //   Set<String> ovrNames = {};
  //   List<PBSharedParameterProp> sharedParameters = [];
  //   overrideProperties ??= [];
  //   for (var prop in overrideProperties) {
  //     if (!ovrNames.contains(prop.overrideName)) {
  //       var properties = extractParameter(prop.overrideName);
  //       sharedParameters.add(PBSharedParameterProp(
  //           name,
  //           properties['type'],
  //           null,
  //           prop.canOverride,
  //           prop.overrideName,
  //           properties['uuid'],
  //           properties['default_value']));
  //       ovrNames.add(prop.overrideName);
  //     }
  //   }
  //   return sharedParameters;
  // }

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
        boundaryRectangle: boundaryRectangle.interpretFrame(),
        style: style,
        prototypeNode: prototypeNodeUUID,
        symbolID: symbolID,
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
        var overrideProp = PBDLOverrideProperty(
          current.UUID,
          current.name,
          override.getPBDLType(),
          await override.getValue(current),
        );
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
