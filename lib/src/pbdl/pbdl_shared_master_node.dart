import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_definition.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_reference.dart';

part 'pbdl_shared_master_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLSharedMasterNode extends PBDLNode
    implements PBDLNodeFactory, PBDLGroupNode {
  String symbolID;

  List<PBDLOverrideProperty> overrideProperties;

  @override
  List<PBDLNode> children = [];

  @override
  final pbdlType = 'shared_master';

  String componentSetName;

  String sharedNodeSetID;

  @JsonKey(includeIfNull: false)
  List<MasterPropertyDefinition> masterPropertyDefinition;

  PBDLSharedMasterNode({
    String UUID,
    this.overrideProperties,
    String name,
    bool isVisible,
    PBDLBoundaryBox boundaryRectangle,
    PBDLStyle style,
    String prototypeNodeUUID,
    bool hasClickThrough,
    groupLayout,
    booleanOperation,
    exportOptions,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    layerListExpandedType,
    presetDictionary,
    bool allowsOverrides,
    nameIsFixed,
    constraints,
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
    this.symbolID,
    bool includeBackgroundColorInInstance,
    verticalRulerData,
    bool resizesContent,
    bool includeInCloudUpload,
    bool isFlowHome,
    List parameters,
    this.children,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
    this.sharedNodeSetID,
    this.componentSetName,
    MasterPropertyReference masterPropertyReferences,
    this.masterPropertyDefinition,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          constraints: (constraints is! Map)
              ? constraints
              : PBDLConstraints.fromJson(constraints),
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
          masterPropertyReferences: masterPropertyReferences,
        );

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLSharedMasterNode.fromJson(json);
  factory PBDLSharedMasterNode.fromJson(Map<String, dynamic> json) =>
      _$PBDLSharedMasterNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLSharedMasterNodeToJson(this);

  @override
  void sortByUUID() {
    /// Sort list of [PBDLOverrideProperty] by UUID
    overrideProperties.sort();

    /// Ensure each `property` sorts its elements
    overrideProperties.forEach((property) => property.sortByUUID());
  }
}
