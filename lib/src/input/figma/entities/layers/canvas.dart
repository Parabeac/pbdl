import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_artboard.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_figma_node_factory.dart';
import 'component.dart';
import 'figma_node.dart';

part 'canvas.g.dart';

@JsonSerializable(explicitToJson: true)
class Canvas extends FigmaChildrenNode implements FigmaNodeFactory {
  @override
  String type = 'CANVAS';

  @override
  @JsonKey(ignore: true)
  List<FigmaNode> children;

  Canvas({
    this.name,
    this.type,
    List<FigmaNode> children,
    this.backgroundColor,
    this.prototypeStartNodeID,
    this.prototypeDevice,
    this.exportSettings,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
    layoutAlign,
    layoutGrow,
  }) : super(name, true, type, null, null,
            transitionNodeID: transitionNodeID,
            transitionDuration: transitionDuration,
            transitionEasing: transitionEasing,
            children: children,
            layoutAlign: layoutAlign,
            layoutGrow: layoutGrow);
  // Last two nulls are used for Figma plugins

  @override
  String name;

  dynamic backgroundColor;

  dynamic prototypeStartNodeID;

  dynamic prototypeDevice;

  dynamic exportSettings;

  Canvas createSketchNode(Map<String, dynamic> json) => Canvas.fromJson(json);
  factory Canvas.fromJson(Map<String, dynamic> json) => _$CanvasFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CanvasToJson(this);

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) => Canvas.fromJson(json);

  @override
  var absoluteBoundingBox;

  @JsonKey(ignore: true)
  var style;

  @override
  Future<PBDLNode> interpretNode() async {
    return Future.value(
      PBDLArtboard(
        backgroundColor: backgroundColor,
        isFlowHome: false, // TODO: get it dynamically
        UUID: UUID,
        exportOptions: exportSettings,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        style: style,
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
        children: await _interpretNodes(children),
      ),
    );
  }

  Future<List<PBDLNode>> _interpretNodes(List<FigmaNode> children) async {
    var processedChildren = <PBDLNode>[];

    for (var child in children) {
      //TODO: Change to FigmaComponentSet
      // Process only Components of ComponentSet
      if (child is Component) {
        processedChildren.addAll(await _interpretNodes(child.children));
      } else {
        processedChildren.add(await child.interpretNode());
      }
    }
    return processedChildren;
  }
}
