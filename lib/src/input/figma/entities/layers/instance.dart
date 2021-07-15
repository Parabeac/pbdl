import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_value.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_instance_node.dart';
import '../../helper/override_value.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'frame.dart';

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
  List children;
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
  PBDLNode interpretNode() {
    var overrideValues = <PBDLOverrideValue>[];
    children.asMap().forEach((key, value) {
      if (value is FigmaNode) {
        overrideValues.add(PBDLOverrideValue(
            value.UUID,
            value.name,
            value.isVisible,
            value is FigmaFrame ? value.boundaryRectangle : null,
            value.type,

            /// Style
            null,
            value.prototypeNodeUUID,
            [value.interpretNode()]));
      }
    });

    return PBDLSharedInstanceNode(
      UUID: UUID,
      overrideValues: overrideValues,
      name: name,
      isVisible: isVisible,
      boundaryRectangle: PBDLFrame.fromJson(boundaryRectangle),
      type: type,
      style: style,
      prototypeNode: prototypeNodeUUID,
      symbolID: symbolID,
      pbdfType: pbdfType,
    );
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
  List<FigmaOverridableValue> get overrideValues => throw UnimplementedError();

  // TODO: implement typeToAbbreviation
  Map<Type, String> get typeToAbbreviation => throw UnimplementedError();
}
