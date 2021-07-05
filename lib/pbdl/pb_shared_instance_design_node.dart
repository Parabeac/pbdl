import 'package:pbdl/input/sketch/entities/objects/override_value.dart';
import 'package:pbdl/input/sketch/helper/symbol_node_mixin.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_shared_instance_design_node.g.dart';

@JsonSerializable()
class PBSharedInstanceDesignNode extends PBDLNode
    with SymbolNodeMixin
    implements PBDLNodeFactory {
  String symbolID;
  List parameters;

  PBSharedInstanceDesignNode(
      {String UUID,
      this.overrideValues,
      String name,
      bool isVisible,
      boundaryRectangle,
      String type,
      style,
      prototypeNode,
      exportOptions,
      booleanOperation,
      bool isFixedToViewport,
      bool isFlippedVertical,
      bool isFlippedHorizontal,
      bool isLocked,
      layerListExpandedType,
      bool nameIsFixed,
      resizingConstraint,
      resizingType,
      num rotation,
      sharedStyleID,
      bool shouldBreakMaskChain,
      bool hasClippingMask,
      int clippingMaskMode,
      userInfo,
      bool maintainScrollPosition,
      num scale,
      this.symbolID,
      num verticalSpacing,
      num horizontalSpacing,
      this.pbdfType})
      : super(UUID, name, isVisible, boundaryRectangle, type, style,
            prototypeNode) {
    pbdfType = 'symbol_instance';
  }

  @override
  String pbdfType = 'symbol_instance';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBSharedInstanceDesignNode.fromJson(json);
  factory PBSharedInstanceDesignNode.fromJson(Map<String, dynamic> json) =>
      _$PBSharedInstanceDesignNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBSharedInstanceDesignNodeToJson(this);

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   return PBSharedInstanceDesignNode(
  //     UUID: json['id'] as String,
  //     booleanOperation: json['booleanOperation'],
  //     exportOptions: json['exportOptions'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     isFixedToViewport: json['isFixedToViewport'] as bool,
  //     isFlippedHorizontal: json['isFlippedHorizontal'] as bool,
  //     isFlippedVertical: json['isFlippedVertical'] as bool,
  //     isLocked: json['isLocked'] as bool,
  //     isVisible: json['visible'] as bool,
  //     layerListExpandedType: json['layerListExpandedType'],
  //     name: json['name'] as String,
  //     nameIsFixed: json['nameIsFixed'] as bool,
  //     resizingConstraint: json['resizingConstraint'],
  //     resizingType: json['resizingType'],
  //     rotation: json['rotation'] as num,
  //     sharedStyleID: json['sharedStyleID'],
  //     shouldBreakMaskChain: json['shouldBreakMaskChain'] as bool,
  //     hasClippingMask: json['hasClippingMask'] as bool,
  //     clippingMaskMode: json['clippingMaskMode'] as int,
  //     userInfo: json['userInfo'],
  //     maintainScrollPosition: json['maintainScrollPosition'] as bool,
  //     overrideValues: (json['overrideValues'] as List)
  //         ?.map((e) => e == null
  //             ? null
  //             : OverridableValue.fromJson(e as Map<String, dynamic>))
  //         ?.toList(),
  //     scale: (json['scale'] as num)?.toDouble(),
  //     symbolID: json['symbolID'] as String,
  //     verticalSpacing: (json['verticalSpacing'] as num)?.toDouble(),
  //     horizontalSpacing: (json['horizontalSpacing'] as num)?.toDouble(),
  //     type: json['type'] as String,
  //     pbdfType: json['pbdfType'],
  //     style: json['style'] == null
  //         ? null
  //         : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
  //   )
  //     ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
  //     ..parameters = json['parameters'] as List;
  // }

  @override
  Future<PBDLNode> interpretNode() {
    /* var sym = PBSharedInstanceIntermediateNode(this, symbolID,
        sharedParamValues: _extractParameters(),
        currentContext: currentContext);
    return Future.value(sym); */
  }

  ///Converting the [OverridableValue] into [PBSharedParameterValue] to be processed in intermediate phase.
  // List<PBSharedParameterValue> _extractParameters() {
  //   Set<String> ovrNames = {};
  //   List<PBSharedParameterValue> sharedParameters = [];
  //   for (var overrideValue in overrideValues) {
  //     if (!ovrNames.contains(overrideValue.overrideName)) {
  //       var properties = extractParameter(overrideValue.overrideName);
  //       sharedParameters.add(PBSharedParameterValue(
  //           properties['type'],
  //           overrideValue.value,
  //           properties['uuid'],
  //           overrideValue.overrideName));
  //       ovrNames.add(overrideValue.overrideName);
  //     }
  //   }

  //   return sharedParameters;
  // }

  final List<OverridableValue> overrideValues;
}
