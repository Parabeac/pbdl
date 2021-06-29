//no packages to import
import 'package:json_annotation/json_annotation.dart';
import '../abstract_figma_node_factory.dart';

@JsonSerializable()
abstract class FigmaNode {
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
  @override
  Map<String, dynamic> toJson();
  factory FigmaNode.fromJson(Map<String, dynamic> json) =>
      AbstractFigmaNodeFactory.getFigmaNode(json);
  @override
  Future<PBIntermediateNode> interpretNode(PBContext currentContext);
}
