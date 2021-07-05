import 'package:pbdl/input/sketch/helper/symbol_node_mixin.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'group_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_shared_master_node.g.dart';

@JsonSerializable()
class PBSharedMasterDesignNode extends PBDLNode
    with SymbolNodeMixin
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

  @override
  Future<PBDLNode> interpretNode() {
    /* var sym_master = PBSharedMasterNode(
      this,
      symbolID,
      name,
      Point(boundaryRectangle.x, boundaryRectangle.y),
      Point(boundaryRectangle.x + boundaryRectangle.width,
          boundaryRectangle.y + boundaryRectangle.height),
      overridableProperties: _extractParameters(),
      currentContext: currentContext,
    );
    return Future.value(sym_master); */
  }

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

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   var node = PBSharedMasterDesignNode(
  //     hasClickThrough: json['hasClickThrough'] as bool,
  //     groupLayout: json['groupLayout'],
  //     UUID: json['id'] as String,
  //     booleanOperation: json['booleanOperation'],
  //     exportOptions: json['exportOptions'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     isFixedToViewport: json['isFixedToViewport'],
  //     isFlippedHorizontal: json['isFlippedHorizontal'],
  //     isFlippedVertical: json['isFlippedVertical'],
  //     isLocked: json['isLocked'],
  //     isVisible: json['visible'],
  //     layerListExpandedType: json['layerListExpandedType'],
  //     name: json['name'],
  //     nameIsFixed: json['nameIsFixed'],
  //     resizingConstraint: json['resizingConstraint'],
  //     resizingType: json['resizingType'],
  //     rotation: json['rotation'],
  //     sharedStyleID: json['sharedStyleID'],
  //     shouldBreakMaskChain: json['shouldBreakMaskChain'],
  //     hasClippingMask: json['hasClippingMask'],
  //     clippingMaskMode: json['clippingMaskMode'],
  //     userInfo: json['userInfo'],
  //     maintainScrollPosition: json['maintainScrollPosition'],
  //     hasBackgroundColor: json['hasBackgroundColor'] as bool,
  //     horizontalRulerData: json['horizontalRulerData'],
  //     includeBackgroundColorInExport:
  //         json['includeBackgroundColorInExport'] as bool,
  //     includeInCloudUpload: json['includeInCloudUpload'] as bool,
  //     isFlowHome: json['isFlowHome'] as bool,
  //     resizesContent: json['resizesContent'] as bool,
  //     verticalRulerData: json['verticalRulerData'],
  //     includeBackgroundColorInInstance:
  //         json['includeBackgroundColorInInstance'] as bool,
  //     symbolID: json['symbolID'] as String,
  //     changeIdentifier: json['changeIdentifier'] as int,
  //     allowsOverrides: json['allowsOverrides'] as bool,
  //     overrideProperties: (json['overrideProperties'] as List)
  //         ?.map((e) => e == null
  //             ? null
  //             : OverridableProperty.fromJson(e as Map<String, dynamic>))
  //         ?.toList(),
  //     presetDictionary: json['presetDictionary'],
  //     type: json['type'] as String,
  //     pbdfType: json['pbdfType'],
  //     parameters: json['parameters'] as List,
  //     style: json['style'] == null
  //         ? null
  //         : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
  //   )..prototypeNodeUUID = json['prototypeNodeUUID'] as String;

  //   if (json.containsKey('children')) {
  //     if (json['children'] != null) {
  //       for (var item in json['children']) {
  //         var child = DesignNode.fromPBDF(item as Map<String, dynamic>);
  //         if (child != null) {
  //           node.children.add(child);
  //         }
  //       }
  //     }
  //   }
  //   return node;
  // }

  @override
  List children = [];
}
