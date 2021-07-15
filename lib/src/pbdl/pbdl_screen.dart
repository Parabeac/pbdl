import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';

part 'pbdl_screen.g.dart';

@JsonSerializable()
class PBDLScreen implements PBDLNodeFactory, PBDLNode {
  String id;
  String name;
  bool convert = true;
  String imageURI;
  String type;
  PBDLNode designNode;

  // Do we still need this?
  // DesignPage parentPage;

  PBDLScreen({
    PBDLNode designNode,
    this.id,
    this.name,
    this.type,
  }) {
    this.designNode = designNode;
  }

  @override
  String pbdfType = 'screen';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLScreen.fromJson(json);
  factory PBDLScreen.fromJson(Map<String, dynamic> json) =>
      _$PBDLScreenFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLScreenToJson(this);

  @override
  String UUID;

  @override
  var boundaryRectangle;

  @override
  PBDLNode child;

  @override
  bool isVisible;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;
}
