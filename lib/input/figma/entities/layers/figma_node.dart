//no packages to import

import '../abstract_figma_node_factory.dart';

@JsonSerializable(nullable: true)
abstract class FigmaNode implements DesignNode {
  @JsonKey(name: 'id')
  @override
  String UUID;

  @override
  String name;

  @override
  String type;

  var pluginData;

  var sharedPluginData;

  @override
  @JsonKey(name: 'visible', defaultValue: true)
  bool isVisible;

  @override
  @JsonKey(name: 'transitionNodeID')
  String prototypeNodeUUID;
  @JsonKey(nullable: true)
  num transitionDuration;
  @JsonKey(nullable: true)
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
