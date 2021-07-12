import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/artboard.dart';
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

  @override
  List children;

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
  Future<PBDLNode> interpretNode() async {
    return PBArtboard(
      backgroundColor: backgroundColor,
      isFlowHome: false, // TODO: get it dynamically
      UUID: UUID,
      exportOptions: exportSettings,
      boundaryRectangle: boundaryRectangle,
      isVisible: isVisible,
      name: name,
      type: type,
      style: style, // TODO:
      prototypeNodeUUID: prototypeNodeUUID,
    );
    /*
    assert(false, 'We don\'t product pages as Intermediate Nodes.');
    return null; */
  }

  @override
  String pbdfType = 'artboard';
}
