import 'package:pbdl/input/figma/entities/layers/figma_node.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import '../abstract_figma_node_factory.dart';

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
  Future<PBDLNode> interpretNode() {
    /*
    assert(false, 'We don\'t product pages as Intermediate Nodes.');
    return null; */
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'artboard';

  // @override
  // DesignNode createDesignNode(Map<String, dynamic> json) {
  //   // TODO: implement createDesignNode
  //   throw UnimplementedError();
  // }

  // @override
  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   // TODO: implement fromPBDF
  //   throw UnimplementedError();
  // }
}
