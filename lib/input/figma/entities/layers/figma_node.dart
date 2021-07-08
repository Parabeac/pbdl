import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
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

  Future<PBDLNode> interpretNode() {}

  factory FigmaNode.fromJson(Map<String, dynamic> json) =>
      _$FigmaNodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaNodeToJson(this);
}
