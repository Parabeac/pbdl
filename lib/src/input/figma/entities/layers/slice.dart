import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
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

  @override
  @JsonKey()
  var absoluteBoundingBox;

  var size;

  FigmaSlice({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    layoutAlign,
    layoutGrow,
    FigmaConstraints constraints,
    this.absoluteBoundingBox,
    this.size,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name,
          visible,
          type,
          pluginData,
          sharedPluginData,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          constraints: constraints,
          layoutAlign: layoutAlign,
          layoutGrow: layoutGrow,
        );

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaSlice.fromJson(json);
  factory FigmaSlice.fromJson(Map<String, dynamic> json) =>
      _$FigmaSliceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaSliceToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    return Future.value(
      PBDLRectangle(
        UUID: UUID,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        style: style.interpretStyle(),
        child: await child.interpretNode(),
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
      ),
    );
  }

  @override
  bool isVisible;

  @JsonKey(ignore: true)
  var style;

  Map<String, dynamic> toPBDF() => toJson();
}
