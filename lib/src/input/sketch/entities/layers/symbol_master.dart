import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/symbol_node_mixin.dart';
import 'package:pbdl/src/input/general_helper/input_formatter.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_master_node.dart';
import '../abstract_sketch_node_factory.dart';
import '../objects/frame.dart';
import '../objects/override_property.dart';
import '../style/color.dart';
import '../style/style.dart';
import 'abstract_group_layer.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'symbol_master.g.dart';

// title: Symbol Master Layer
// description: A symbol master layer represents a reusable group of layers
@JsonSerializable()
class SymbolMaster extends AbstractGroupLayer
    with SymbolNodeMixin
    implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'symbolMaster';
  final Color backgroundColor;
  final bool hasBackgroundColor;
  final dynamic horizontalRulerData;
  final bool includeBackgroundColorInExport;
  final bool includeInCloudUpload;
  final bool isFlowHome;
  final bool resizesContent;
  final dynamic verticalRulerData;
  final bool includeBackgroundColorInInstance;
  String symbolID;
  final int changeIdentifier;
  final bool allowsOverrides;
  final List<OverridableProperty> overrideProperties;
  final dynamic presetDictionary;
  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;

  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  @JsonKey(name: '_class')
  String type;

  bool _isVisible;

  Style _style;

  set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  set style(_style) => this._style = _style;

  @override
  Style get style => _style;

  @override
  @JsonKey(name: 'layers')
  List children;

  @JsonKey(ignore: true)
  String pbdfType = 'symbol_master';

  SymbolMaster(
      {bool hasClickThrough,
      groupLayout,
      List<SketchNode> this.children,
      this.UUID,
      booleanOperation,
      exportOptions,
      Frame this.boundaryRectangle,
      Flow flow,
      isFixedToViewport,
      isFlippedHorizontal,
      isFlippedVertical,
      isLocked,
      isVisible,
      layerListExpandedType,
      name,
      nameIsFixed,
      resizingConstraint,
      resizingType,
      rotation,
      sharedStyleID,
      shouldBreakMaskChain,
      hasClippingMask,
      clippingMaskMode,
      userInfo,
      Style style,
      maintainScrollPosition,
      this.backgroundColor,
      this.hasBackgroundColor,
      this.horizontalRulerData,
      this.includeBackgroundColorInExport,
      this.includeInCloudUpload,
      this.isFlowHome,
      this.resizesContent,
      this.verticalRulerData,
      this.includeBackgroundColorInInstance,
      this.symbolID,
      this.changeIdentifier,
      this.allowsOverrides,
      this.overrideProperties,
      this.presetDictionary})
      : _isVisible = isVisible,
        _style = style,
        super(
            hasClickThrough,
            groupLayout,
            children,
            UUID,
            booleanOperation,
            exportOptions,
            boundaryRectangle,
            flow,
            isFixedToViewport,
            isFlippedHorizontal,
            isFlippedVertical,
            isLocked,
            isVisible,
            layerListExpandedType,
            name,
            nameIsFixed,
            resizingConstraint,
            resizingType,
            rotation,
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition) {
    if (name != null) {
      this.name = name?.replaceAll(RegExp(r'[\s_\+]'), '');
      this.name = PBInputFormatter.removeFirstDigits(name);
    }
  }

  List parameters;

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      SymbolMaster.fromJson(json);
  factory SymbolMaster.fromJson(Map<String, dynamic> json) =>
      _$SymbolMasterFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SymbolMasterToJson(this);

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
  Future<PBDLNode> interpretNode() {
    var overrideProps = overrideProperties.map((element) {
      var uuidTypeMap = extractParameter(element.overrideName);
      return PBDLOverrideProperty(
        uuidTypeMap['uuid'],
        element.overrideName,
        null,
        null,
        uuidTypeMap['type'],
        null,
        prototypeNodeUUID,
        '', //TODO: we need to look up the default value of the symbol master
      );
    }).toList();

    return Future.value(PBDLSharedMasterNode(
      UUID: UUID,
      allowsOverrides: allowsOverrides,
      overrideProperties: overrideProps,
      booleanOperation: booleanOperation,
      boundaryRectangle: boundaryRectangle,
      changeIdentifier: changeIdentifier,
      clippingMaskMode: clippingMaskMode,
      exportOptions: exportOptions,
      groupLayout: groupLayout,
      hasBackgroundColor: hasBackgroundColor,
      hasClickThrough: hasClickThrough,
      hasClippingMask: hasClippingMask,
      horizontalRulerData: horizontalRulerData,
      includeBackgroundColorInExport: includeBackgroundColorInExport,
      includeBackgroundColorInInstance: includeBackgroundColorInInstance,
      isLocked: isLocked,
      isVisible: isVisible,
      name: name,
      nameIsFixed: nameIsFixed,
      verticalRulerData: verticalRulerData,
      pbdfType: pbdfType,
      sharedStyleID: sharedStyleID,
      symbolID: symbolID,
      userInfo: userInfo,
      type: type,
      style: style,
      shouldBreakMaskChain: shouldBreakMaskChain,
      rotation: rotation,
      resizingType: resizingType,
      resizingConstraint: resizingConstraint,
      resizesContent: resizesContent,
      presetDictionary: presetDictionary,
      maintainScrollPosition: maintainScrollPosition,
      layerListExpandedType: layerListExpandedType,
      isFlowHome: isFlowHome,
      isFlippedVertical: isFlippedVertical,
      isFlippedHorizontal: isFlippedHorizontal,
      includeInCloudUpload: includeInCloudUpload,
      isFixedToViewport: isFixedToViewport,
      parameters: parameters,
    ));
  }
}
