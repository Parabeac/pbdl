import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_rectangle.dart';
import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';

part 'slice.g.dart';

@JsonSerializable()

///A slice is an invisible object with a bounding box,
///represented as dashed lines in the editor.
///Its purpose is to allow you to export a specific part of a document.
///Generally, the only thing you will do with a slice is to add an
///exportSettings and export its content via exportAsync.
class FigmaSlice extends FigmaNode implements FigmaNodeFactory {
  @override
  String type = 'SLICE';

  String layoutAlign;

  var constraints;

  @override
  @JsonKey(name: 'absoluteBoundingBox')
  var boundaryRectangle;

  var size;

  FigmaSlice({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    this.layoutAlign,
    this.constraints,
    this.boundaryRectangle,
    this.size,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name,
          visible,
          type,
          pluginData,
          sharedPluginData,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'image';
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaSlice.fromJson(json);
  factory FigmaSlice.fromJson(Map<String, dynamic> json) =>
      _$FigmaSliceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaSliceToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    return Future.value(PBDLRectangle(
      UUID: UUID,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isVisible: isVisible,
      name: name,
      pbdfType: pbdfType,
      style: style.interpretStyle(),
      child: await child.interpretNode(),
    ));
  }

  @override
  bool isVisible;

  @override
  @JsonKey(ignore: true)
  var style;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'image';
}
