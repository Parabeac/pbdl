import 'package:json_annotation/json_annotation.dart';
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

@JsonSerializable()
class Instance extends FigmaFrame implements AbstractFigmaNodeFactory {
  @override
  String type = 'INSTANCE';

  @override
  List parameters;

  @override
  String symbolID;

  @override
  List<FigmaNode> children;
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
      List<FigmaNode> this.children,
      this.parameters,
      this.symbolID,
      FigmaColor backgroundColor,
      String prototypeNodeUUID,
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
            prototypeNodeUUID: prototypeNodeUUID,
            transitionDuration: transitionDuration,
            transitionEasing: transitionEasing) {
    pbdfType = 'symbol_instance';
  }

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
      overrideValues.addAll(await _traverseChildrenForOverrides(child));
    });

    return Future.value(PBDLSharedInstanceNode(
      UUID: UUID,
      overrideValues: overrideValues,
      name: name,
      isVisible: isVisible,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      type: type,
      style: style,
      prototypeNode: prototypeNodeUUID,
      symbolID: symbolID,
      pbdfType: pbdfType,
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
            current.isVisible,
            null,
            override.getPBDLType(),
            null,
            current.prototypeNodeUUID,
            await current.interpretNode()));
      }

      // TODO: We need to check attributes that may have `children` or other properties
      if (current.child != null) {
        stack.add(current.child);
      }
    }
    return Future.value(values);
  }

  @override
  String pbdfType = 'symbol_instance';

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
