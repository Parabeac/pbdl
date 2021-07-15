import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_artboard.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_group_node.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../../helper/style_extractor.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';

part 'frame.g.dart';

@JsonSerializable()
class FigmaFrame extends FigmaNode
    with PBColorMixin
    implements FigmaNodeFactory {
  @JsonKey(name: 'absoluteBoundingBox')
  var boundaryRectangle;

  @JsonKey(ignore: true)
  var style;

  List<FigmaNode> children;

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

  FigmaColor backgroundColor;

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
    this.boundaryRectangle,
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
  PBDLNode interpretNode() {
    /// TODO: change `isHomeScreen` to its actual value
    if (isScaffold) {
      return PBDLArtboard(
        backgroundColor: backgroundColor.interpretColor(),
        isFlowHome: false,
        UUID: UUID,
        boundaryRectangle: PBDLFrame.fromJson(boundaryRectangle),
        isVisible: isVisible,
        name: name,
        type: type,
        style: style.interpretStyle(),
        prototypeNodeUUID: prototypeNodeUUID,
        children: children.map((e) => e.interpretNode()).toList(),
      );
    } else {
      return PBDLGroupNode(
        UUID: UUID,
        boundaryRectangle: PBDLFrame.fromJson(boundaryRectangle),
        isVisible: isVisible,
        name: name,
        pbdfType: pbdfType,
        style: style,
        children: children.map((e) => e.interpretNode()).toList(),
      );
    }
  }

  @override
  String imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'group';
}
