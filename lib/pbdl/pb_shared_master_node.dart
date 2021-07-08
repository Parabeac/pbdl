import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'group_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_shared_master_node.g.dart';

@JsonSerializable()
class PBSharedMasterDesignNode extends PBDLNode
    implements PBDLNodeFactory, GroupNode {
  String symbolID;
  List overriadableProperties;

  var overrideProperties;

  PBSharedMasterDesignNode({
    String UUID,
    this.overrideProperties,
    String name,
    bool isVisible,
    boundaryRectangle,
    String type,
    style,
    prototypeNode,
    bool hasClickThrough,
    groupLayout,
    booleanOperation,
    exportOptions,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    layerListExpandedType,
    this.pbdfType,
    presetDictionary,
    bool allowsOverrides,
    nameIsFixed,
    resizingConstraint,
    resizingType,
    horizontalRulerData,
    bool hasBackgroundColor,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    bool includeBackgroundColorInExport,
    int changeIdentifier,
    String this.symbolID,
    bool includeBackgroundColorInInstance,
    verticalRulerData,
    bool resizesContent,
    bool includeInCloudUpload,
    bool isFlowHome,
    List parameters,
  }) : super(UUID, name, isVisible, boundaryRectangle, type, style,
            prototypeNode) {
    pbdfType = 'symbol_master';
  }

  @override
  String pbdfType = 'symbol_master';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBSharedMasterDesignNode.fromJson(json);
  factory PBSharedMasterDesignNode.fromJson(Map<String, dynamic> json) =>
      _$PBSharedMasterDesignNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBSharedMasterDesignNodeToJson(this);

  ///Converting the [OverridableProperty] into [PBSharedParameterProp] to be processed in intermediate phase.
  // List<PBSharedParameterProp> _extractParameters() {
  //   Set<String> ovrNames = {};
  //   List<PBSharedParameterProp> sharedParameters = [];
  //   for (var prop in overrideProperties) {
  //     if (!ovrNames.contains(prop.overrideName)) {
  //       var properties = AddMasterSymbolName(prop.overrideName, children);
  //       sharedParameters.add(PBSharedParameterProp(
  //           properties['name'],
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
  List children = [];
}
