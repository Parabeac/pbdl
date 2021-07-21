import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_value.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_instance_node.dart';
import '../../helper/override_value.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'figma_frame.dart';

part 'instance.g.dart';

@JsonSerializable(explicitToJson: true)
class Instance extends FigmaFrame implements AbstractFigmaNodeFactory {
  @override
  String type = 'INSTANCE';

  List parameters;

  Instance(
      {name,
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
      this.componentId,
      List<FigmaNode> children,
      this.parameters,
      FigmaColor backgroundColor,
      String transitionNodeID,
      num transitionDuration,
      String transitionEasing})
      : super(
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
            transitionNodeID: transitionNodeID,
            transitionDuration: transitionDuration,
            transitionEasing: transitionEasing);

  String componentId;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      Instance.fromJson(json);
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InstanceToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    var overrideValues = <PBDLOverrideValue>[];
    children.forEach((child) async {
      var currVals = await _traverseChildrenForOverrides(child)
        ..removeWhere((element) => element.value == null);
      overrideValues.addAll(currVals);
    });

    return Future.value(PBDLSharedInstanceNode(
      UUID: UUID,
      overrideValues: overrideValues,
      name: name,
      isVisible: isVisible,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      style: style,
      prototypeNodeUUID: transitionNodeID,
      symbolID: componentId,
    ));
  }

  Future<List<PBDLOverrideValue>> _traverseChildrenForOverrides(
      FigmaNode root) async {
    var stack = [root];
    var values = <PBDLOverrideValue>[];
    while (stack.isNotEmpty) {
      var current = stack.removeLast();

      // Checks if `current` node should be an override property
      var override = FigmaOverrideTypeFactory.getType(current);

      if (override != null) {
        // Create override value and add it to list
        values.add(PBDLOverrideValue(
          current.UUID.split(';').last, // Get UUID of node to replace
          current.name,
          override.getPBDLType(),
          await override.getValue(current),
        ));
      }

      if (current.child != null) {
        stack.add(current.child);
      } else if (current is FigmaChildrenNode && current.children != null) {
        current.children.forEach(stack.add);
      }
    }
    return Future.value(values);
  }

  Map AddMasterSymbolName(String overrideName, List children) {
    // TODO: implement AddMasterSymbolName
    throw UnimplementedError();
  }

  String FindName(String uuid, List children, Type type) {
    // TODO: implement FindName
    throw UnimplementedError();
  }

  Map extractParameter(String overrideName) {
    // TODO: implement extractParameter
    throw UnimplementedError();
  }

  // TODO: implement overrideValues
  // List<FigmaOverridableValue> get overrideValues => overrideValues;
  List<FigmaOverridableValue> overrideValues;

  // TODO: implement typeToAbbreviation
  Map<Type, String> get typeToAbbreviation => throw UnimplementedError();
}
