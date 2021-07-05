import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/input/figma/helper/style_extractor.dart';
import 'package:pbdl/input/helper/pb_color.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'frame.g.dart';

@JsonSerializable()
class FigmaFrame extends FigmaNode
    with PBColorMixin
    implements FigmaNodeFactory {
  @JsonKey(name: 'absoluteBoundingBox')
  var boundaryRectangle;

  @JsonKey(ignore: true)
  var style;

  List children;

  @JsonKey(ignore: true)
  var fills;

  var strokes;

  double strokeWeight;

  String strokeAlign;

  double cornerRadius;

  var constraints;

  String layoutAlign;

  var size;

  double horizontalPadding;

  double verticalPadding;

  double itemSpacing;

  PBColor backgroundColor;

  @override
  String type = 'FRAME';

  @JsonKey(ignore: true)
  bool isScaffold = false;

  @JsonKey(defaultValue: false)
  var isFlowHome = false;

  FigmaFrame({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    Frame this.boundaryRectangle,
    this.style,
    this.fills,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.cornerRadius,
    this.constraints,
    this.layoutAlign,
    this.size,
    this.horizontalPadding,
    this.verticalPadding,
    this.itemSpacing,
    List<FigmaNode> this.children,
    String UUID,
    FigmaColor this.backgroundColor,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
    String prototypeNodeUUID,
  }) : super(
          name,
          isVisible,
          type,
          pluginData,
          sharedPluginData,
          UUID: UUID,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'group';
  }
  @JsonKey(ignore: true)
  List points;

  @JsonKey(name: 'fills')
  List fillsList;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaFrame.fromJson(json);
    node.style = StyleExtractor().getStyle(json);
    return node;
  }

  factory FigmaFrame.fromJson(Map<String, dynamic> json) =>
      _$FigmaFrameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaFrameToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    /*
    /// TODO: change `isHomeScreen` to its actual value
    if (isScaffold) {
      return Future.value(InheritedScaffold(
        this,
        currentContext: currentContext,
        name: name,
        isHomeScreen: isFlowHome,
      ));
    } else {
      var tempGroup = Group(
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
        UUID: UUID,
        backgroundColor: backgroundColor,
        prototypeNodeUUID: prototypeNodeUUID,
        transitionDuration: transitionDuration,
        transitionEasing: transitionEasing,
      );

      return Future.value(tempGroup.interpretNode(currentContext)); */
    // }
  }

  @override
  String imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'group';
}
