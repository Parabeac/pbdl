import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/helper/component_cache_service.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type_factory.dart';
import '../../helper/override_value.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'figma_frame.dart';
part 'instance.g.dart';

@JsonSerializable(explicitToJson: true)
class Instance extends FigmaFrame {
  @override
  String type = 'INSTANCE';

  List parameters;

  Instance({
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
    layoutGrow,
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
            constraints: constraints,
            layoutAlign: layoutAlign,
            layoutGrow: layoutGrow,
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
    var cacheService = ComponentCacheService();
    var overrideValues = <PBDLOverrideValue>[];
    children.forEach((child) async {
      var currVals = await _traverseChildrenForOverrides(child)
        ..removeWhere((element) => element.value == null);
      overrideValues.addAll(currVals);
    });

    /// If the component is not a local component
    /// then the instance must become a component aka [PBDLSharedMasterNode]
    if (cacheService.localComponents.containsKey(componentId)) {
      return Future.value(PBDLSharedInstanceNode(
        UUID: UUID,
        overrideValues: overrideValues,
        name: name,
        isVisible: isVisible,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        style: figmaStyleProperty.interpretStyle(),
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        symbolID: componentId,
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
        sharedNodeSetID: cacheService.getComponentSetId(componentId),
      ));
    } else {
      cacheService.localComponents[componentId] = toJson()
        ..['componentSetId'] = componentId;
      return Future.value(
        PBDLSharedMasterNode(
          UUID: componentId,
          overrideProperties: null,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: absoluteBoundingBox.interpretFrame(),
          style: figmaStyleProperty?.interpretStyle(),
          prototypeNodeUUID: transitionNodeID,
          symbolID: componentId,
          constraints: constraints.interpret(),
          isFlowHome: isFlowHome,
          layoutMainAxisSizing: getGrowSizing(layoutGrow),
          layoutCrossAxisSizing: getAlignSizing(layoutAlign),
          children: await Future.wait(
            children.map((e) async => await e.interpretNode()).toList(),
          ),
          sharedNodeSetID: cacheService.getComponentSetId(componentId),
          // componentSetName: componentsetName
        ),
      );
    }
  }

  Future<List<PBDLOverrideValue>> _traverseChildrenForOverrides(
      FigmaNode root) async {
    var stack = [root];
    var values = <PBDLOverrideValue>[];
    while (stack.isNotEmpty) {
      var current = stack.removeLast();

      // Do not add child instance overrides to current instance
      if (current is Instance) {
        continue;
      }

      // Checks if `current` node should be an override property
      var override = FigmaOverrideTypeFactory.getType(current);

      if (override != null) {
        // Create override value and add it to list
        values.add(PBDLOverrideValue(
          current.UUID.split(';').last, // Get UUID of node to replace
          current.name,
          override.getPBDLType(),
          await override.getProperty(current),
          await override.getValue(current),
        )..constraints = current.constraints?.interpret());
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
