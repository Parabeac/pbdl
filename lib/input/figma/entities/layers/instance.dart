

import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/input/sketch/entities/objects/override_value.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'instance.g.dart';

@JsonSerializable(nullable: true)
class Instance extends FigmaFrame
    implements AbstractFigmaNodeFactory, PBSharedInstanceDesignNode {
  @override
  String type = 'INSTANCE';

  @override
  List parameters;

  @override
  String symbolID;

  @override
  List children;
  Instance(
      {name,
      isVisible,
      type,
      pluginData,
      sharedPluginData,
      Frame boundaryRectangle,
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
            boundaryRectangle: boundaryRectangle,
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
  Future<PBDLNode> interpretNode() {
    /// TODO: Check if `sharedParamValues` exits and pass to it, default to emptu for now
    var sym = PBSharedInstanceIntermediateNode(
      this,
      componentId,
      sharedParamValues: [],
      currentContext: currentContext,
    );
    return Future.value(sym);
  }

  @override
  String pbdfType = 'symbol_instance';

  @override
  Map AddMasterSymbolName(String overrideName, List children) {
    // TODO: implement AddMasterSymbolName
    throw UnimplementedError();
  }

  @override
  String FindName(String uuid, List children, Type type) {
    // TODO: implement FindName
    throw UnimplementedError();
  }

  @override
  Map extractParameter(String overrideName) {
    // TODO: implement extractParameter
    throw UnimplementedError();
  }

  @override
  // TODO: implement overrideValues
  List<OverridableValue> get overrideValues => throw UnimplementedError();

  @override
  // TODO: implement typeToAbbreviation
  Map<Type, String> get typeToAbbreviation => throw UnimplementedError();
}
