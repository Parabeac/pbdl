import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_shared_master_node.dart';

import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'figma_frame.dart';

part 'component.g.dart';

@JsonSerializable()
class Component extends FigmaFrame implements AbstractFigmaNodeFactory {
  @override
  String type = 'COMPONENT';
  Component({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    boundaryRectangle,
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
          boundaryRectangle: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
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

  // List<PBSharedParameterProp> _extractParameters() {
  //   Set<String> ovrNames = {};
  //   List<PBSharedParameterProp> sharedParameters = [];
  //   overrideProperties ??= [];
  //   for (var prop in overrideProperties) {
  //     if (!ovrNames.contains(prop.overrideName)) {
  //       var properties = extractParameter(prop.overrideName);
  //       sharedParameters.add(PBSharedParameterProp(
  //           name,
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
      overrideProperties: overriadableProperties, // TODO: extract them
      name: name,
      isVisible: isVisible,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      type: type,
      style: style,
      prototypeNode: prototypeNodeUUID,
      pbdfType: pbdfType,
      symbolID: symbolID,
      isFlowHome: isFlowHome,
    );
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
  var isFlowHome;
}
