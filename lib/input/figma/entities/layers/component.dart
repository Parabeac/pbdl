import 'package:json_annotation/json_annotation.dart';

import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:pbdl/input/sketch/helper/symbol_node_mixin.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'component.g.dart';

@JsonSerializable()
class Component extends FigmaFrame
    with SymbolNodeMixin
    implements AbstractFigmaNodeFactory {
  @override
  String type = 'COMPONENT';
  Component({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    Frame boundaryRectangle,
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
    this.overrideProperties,
    List<FigmaNode> children,
    FigmaColor backgroundColor,
    this.symbolID,
    this.overriadableProperties,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
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
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'symbol_master';
  }

  // make sure only store unique UUID overrides with Map
  @override
  var overrideProperties;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      Component.fromJson(json);
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ComponentToJson(this);

  List<PBSharedParameterProp> _extractParameters() {
    Set<String> ovrNames = {};
    List<PBSharedParameterProp> sharedParameters = [];
    overrideProperties ??= [];
    for (var prop in overrideProperties) {
      if (!ovrNames.contains(prop.overrideName)) {
        var properties = extractParameter(prop.overrideName);
        sharedParameters.add(PBSharedParameterProp(
            name,
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
  Future<PBDLNode> interpretNode() {
    /*
    var sym_master = PBSharedMasterNode(
      this,
      UUID,
      name,
      Point(boundaryRectangle.x, boundaryRectangle.y),
      Point(boundaryRectangle.x + boundaryRectangle.width,
          boundaryRectangle.y + boundaryRectangle.height),
      overridableProperties: _extractParameters() ?? [],
      currentContext: currentContext,
    );
    return Future.value(sym_master); */
  }

  @override
  List overriadableProperties;

  @override
  String symbolID;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
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

  @override
  var isFlowHome;
}
