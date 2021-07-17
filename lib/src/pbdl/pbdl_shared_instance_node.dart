import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_value.dart';
import 'abstract_pbdl_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_shared_instance_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLSharedInstanceNode extends PBDLNode implements PBDLNodeFactory {
  String symbolID;
  List parameters;

  final List<PBDLOverrideValue> overrideValues;
  @override
  PBDLFrame boundaryRectangle;

  PBDLSharedInstanceNode(
      {String UUID,
      this.overrideValues,
      String name,
      bool isVisible,
      this.boundaryRectangle,
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
      PBDLSharedInstanceNode.fromJson(json);
  factory PBDLSharedInstanceNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLSharedInstanceNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLSharedInstanceNodeToJson(this);

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

}
