import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/general_helper/input_formatter.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
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
class SymbolMaster extends AbstractGroupLayer implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'symbolMaster';
  @override
  var overrideValues;
  final Color backgroundColor;
  final bool hasBackgroundColor;
  final dynamic horizontalRulerData;
  final bool includeBackgroundColorInExport;
  final bool includeInCloudUpload;
  final bool isFlowHome;
  final bool resizesContent;
  final dynamic verticalRulerData;
  final bool includeBackgroundColorInInstance;
  @override
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

  @override
  @JsonKey(name: '_class')
  String type;

  bool _isVisible;

  Style _style;

  @override
  void set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style get style => _style;

  @override
  @JsonKey(name: 'layers')
  List<SketchNode> children;

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

  @override
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
  PBDLNode interpretNode() {
    return PBDLSharedMasterNode(
      UUID: UUID,
      booleanOperation: booleanOperation,
      exportOptions: exportOptions,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isFixedToViewport: isFixedToViewport,
      isFlippedHorizontal: isFlippedHorizontal,
      isFlippedVertical: isFlippedVertical,
      isLocked: isLocked,
      isVisible: isVisible,
      layerListExpandedType: layerListExpandedType,
      name: name,
      nameIsFixed: nameIsFixed,
      resizingConstraint: resizingConstraint,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      pbdfType: pbdfType,
      style: style.interpretStyle(),
      type: type,
      prototypeNode: prototypeNodeUUID,
      symbolID: symbolID,
      overrideProperties: overrideProperties,
      isFlowHome: isFlowHome,
      allowsOverrides: allowsOverrides,
      hasBackgroundColor: hasBackgroundColor,
      parameters: parameters,
      resizesContent: resizesContent,
      includeInCloudUpload: includeInCloudUpload,
      includeBackgroundColorInExport: includeBackgroundColorInExport,
      includeBackgroundColorInInstance: includeBackgroundColorInInstance,
      presetDictionary: presetDictionary,
    );
    /*
    var sym_master = PBSharedMasterNode(
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

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'symbol_master';
}
