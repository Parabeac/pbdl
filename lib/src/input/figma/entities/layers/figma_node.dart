import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import '../abstract_figma_node_factory.dart';

part 'figma_node.g.dart';

@JsonSerializable(nullable: true)
class FigmaNode {
  @JsonKey(
    name: 'id',
  )
  String UUID;

  String name;

  String type;

  var pluginData;

  var sharedPluginData;

  FigmaRect boundaryRectangle;

  FigmaNode child;

  @JsonKey(name: 'visible', defaultValue: true)
  bool isVisible;

  @JsonKey(name: 'transitionNodeID')
  String prototypeNodeUUID;
  @JsonKey()
  num transitionDuration;
  @JsonKey()
  String transitionEasing;

  FigmaNode(
    this.name,
    this.isVisible,
    this.type,
    this.pluginData,
    this.sharedPluginData, {
    this.UUID,
    this.prototypeNodeUUID,
    this.transitionDuration,
    this.transitionEasing,
  });

  Future<PBDLNode> interpretNode() async {
    return Future.value(PBDLNode(
      UUID,
      name,
      isVisible,
      null,
      type,
      null,
      prototypeNodeUUID,
      child: await child.interpretNode(),
    ));
  }

  factory FigmaNode.fromJson(Map<String, dynamic> json) =>
      AbstractFigmaNodeFactory.getFigmaNode(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaNodeToJson(this);
}
