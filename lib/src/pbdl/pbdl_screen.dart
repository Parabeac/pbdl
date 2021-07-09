import 'package:pbdl/src/pbdl/abstract_design_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_screen.g.dart';

@JsonSerializable()
class PBDLScreen implements PBDLNodeFactory {
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
  PBDLScreen createPBDLNode(Map<String, dynamic> json) =>
      PBDLScreen.fromJson(json);
  factory PBDLScreen.fromJson(Map<String, dynamic> json) =>
      _$PBDLScreenFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLScreenToJson(this);
}
