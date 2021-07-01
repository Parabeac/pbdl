
import 'package:pbdl/design_logic/pbdl_node.dart';
import 'package:pbdl/input/sketch/entities/abstract_sketch_node_factory.dart';
import 'package:pbdl/input/sketch/entities/layers/abstract_layer.dart';
import 'package:pbdl/input/sketch/entities/layers/flow.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:pbdl/input/sketch/entities/objects/override_property.dart';
import 'package:pbdl/input/sketch/entities/style/color.dart';
import 'package:pbdl/input/sketch/entities/style/style.dart';
import 'package:pbdl/input/sketch/helper/symbol_node_mixin.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'symbol_master.g.dart';

// title: Symbol Master Layer
// description: A symbol master layer represents a reusable group of layers
@JsonSerializable(nullable: true)
class SymbolMaster extends AbstractGroupLayer
    with SymbolNodeMixin
    implements SketchNodeFactory, PBSharedInstanceDesignNode {
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
  List children;

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
  List<PBSharedParameterProp> _extractParameters() {
    Set<String> ovrNames = {};
    List<PBSharedParameterProp> sharedParameters = [];
    for (var prop in overrideProperties) {
      if (!ovrNames.contains(prop.overrideName)) {
        var properties = AddMasterSymbolName(prop.overrideName, children);
        sharedParameters.add(PBSharedParameterProp(
            properties['name'],
            properties['type'],
            null,
            prop.canOverride,
            prop.overrideName,
            properties['uuid'],
            properties['default_value']));
        ovrNames.add(prop.overrideName);
      }
    }
    return sharedParameters;
  }

  @override
  Future<PBDLNode> interpretNode() { /*
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
  Map<String, dynamic> toPBDF() => <String, dynamic>{
        'booleanOperation': booleanOperation,
        'exportOptions': exportOptions,
        'flow': flow,
        'isFixedToViewport': isFixedToViewport,
        'isFlippedHorizontal': isFlippedHorizontal,
        'isFlippedVertical': isFlippedVertical,
        'isLocked': isLocked,
        'layerListExpandedType': layerListExpandedType,
        'name': name,
        'nameIsFixed': nameIsFixed,
        'resizingConstraint': resizingConstraint,
        'resizingType': resizingType,
        'rotation': rotation,
        'sharedStyleID': sharedStyleID,
        'shouldBreakMaskChain': shouldBreakMaskChain,
        'hasClippingMask': hasClippingMask,
        'clippingMaskMode': clippingMaskMode,
        'userInfo': userInfo,
        'maintainScrollPosition': maintainScrollPosition,
        'prototypeNodeUUID': prototypeNodeUUID,
        'hasClickThrough': hasClickThrough,
        'groupLayout': groupLayout,
        'CLASS_NAME': CLASS_NAME,
        'backgroundColor': backgroundColor,
        'hasBackgroundColor': hasBackgroundColor,
        'horizontalRulerData': horizontalRulerData,
        'includeBackgroundColorInExport': includeBackgroundColorInExport,
        'includeInCloudUpload': includeInCloudUpload,
        'isFlowHome': isFlowHome,
        'resizesContent': resizesContent,
        'verticalRulerData': verticalRulerData,
        'includeBackgroundColorInInstance': includeBackgroundColorInInstance,
        'symbolID': symbolID,
        'changeIdentifier': changeIdentifier,
        'allowsOverrides': allowsOverrides,
        'overrideProperties': overrideProperties,
        'presetDictionary': presetDictionary,
        'absoluteBoundingBox': boundaryRectangle,
        'id': UUID,
        'type': type,
        'visible': isVisible,
        'style': style,
        'children': getChildren(),
        'parameters': parameters,
        'pbdfType': pbdfType,
      };

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'symbol_master';

  @override
  DesignNode createDesignNode(Map<String, dynamic> json) {
    // TODO: implement createDesignNode
    throw UnimplementedError();
  }

  @override
  DesignNode fromPBDF(Map<String, dynamic> json) {
    // TODO: implement fromPBDF
    throw UnimplementedError();
  }
}
