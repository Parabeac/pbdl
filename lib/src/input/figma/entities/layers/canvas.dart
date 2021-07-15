import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_artboard.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';

part 'canvas.g.dart';

@JsonSerializable()
class Canvas extends FigmaNode implements FigmaNodeFactory {
  @override
  String type = 'CANVAS';

  Canvas({
    this.name,
    this.type,
    List<FigmaNode> this.children,
    this.backgroundColor,
    this.prototypeStartNodeID,
    this.prototypeDevice,
    this.exportSettings,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name,
          true,
          type,
          null,
          null,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'artboard';
  }
  // Last two nulls are used for Figma plugins

  @override
  String name;

  List<FigmaNode> children;

  dynamic backgroundColor;

  dynamic prototypeStartNodeID;

  dynamic prototypeDevice;

  dynamic exportSettings;

  Canvas createSketchNode(Map<String, dynamic> json) => Canvas.fromJson(json);
  factory Canvas.fromJson(Map<String, dynamic> json) => _$CanvasFromJson(json);

  Map<String, dynamic> toJson() => _$CanvasToJson(this);

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) => Canvas.fromJson(json);

  @override
  var boundaryRectangle;

  @override
  String prototypeNodeUUID;

  @override
  @JsonKey(ignore: true)
  var style;

  @override
  PBDLNode interpretNode() {
    return PBDLArtboard(
      backgroundColor: backgroundColor,
      isFlowHome: false, // TODO: get it dynamically
      UUID: UUID,
      exportOptions: exportSettings,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isVisible: isVisible,
      name: name,
      type: type,
      style: style,
      prototypeNodeUUID: prototypeNodeUUID,
      children: children.map((e) => e.interpretNode()).toList(),
    );
    /*
    assert(false, 'We don\'t product pages as Intermediate Nodes.');
    return null; */
  }

  @override
  String pbdfType = 'artboard';
}
