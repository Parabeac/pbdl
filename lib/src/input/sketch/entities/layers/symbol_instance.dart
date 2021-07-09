import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_sketch_node_factory.dart';
import '../objects/frame.dart';
import '../objects/override_value.dart';
import '../style/style.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'symbol_instance.g.dart';

// title: Symbol Instance Layer
// description: Symbol instance layers represent an instance of a symbol master
@JsonSerializable()
class SymbolInstance extends SketchNode implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'symbolInstance';
  final List<OverridableValue> overrideValues;
  final double scale;
  @override
  String symbolID;
  final double verticalSpacing;
  final double horizontalSpacing;

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

  SymbolInstance(
      {this.UUID,
      booleanOperation,
      exportOptions,
      Frame this.boundaryRectangle,
      Flow flow,
      bool isFixedToViewport,
      bool isFlippedHorizontal,
      bool isFlippedVertical,
      bool isLocked,
      bool isVisible,
      layerListExpandedType,
      String name,
      bool nameIsFixed,
      resizingConstraint,
      resizingType,
      num rotation,
      sharedStyleID,
      bool shouldBreakMaskChain,
      bool hasClippingMask,
      int clippingMaskMode,
      userInfo,
      Style style,
      bool maintainScrollPosition,
      this.overrideValues,
      this.scale,
      this.symbolID,
      this.verticalSpacing,
      this.horizontalSpacing})
      : _isVisible = isVisible,
        _style = style,
        super(
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
            rotation?.toDouble(),
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition);

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      SymbolInstance.fromJson(json);

  factory SymbolInstance.fromJson(Map<String, dynamic> json) =>
      _$SymbolInstanceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SymbolInstanceToJson(this);

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

  @override
  Future<PBDLNode> interpretNode() {
    /*
    var sym = PBSharedInstanceIntermediateNode(this, symbolID,
        sharedParamValues: _extractParameters(),
        currentContext: currentContext);
    return Future.value(sym); */
  }

  @override
  List parameters;

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'symbol_instance';
}
