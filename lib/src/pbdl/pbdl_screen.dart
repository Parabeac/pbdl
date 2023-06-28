import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';

part 'pbdl_screen.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLScreen extends PBDLNode implements PBDLNodeFactory {
  bool? convert = true;
  String? imageURI;

  @override
  String? pbdlType = 'screen';

  PBDLNode? designNode;

  @override
  bool? isVisible;

  // Do we still need this?
  // DesignPage parentPage;

  PBDLScreen({
    PBDLNode? designNode,
    String UUID = '',
    String? name,
    this.isVisible,
  }) : super(UUID, name, isVisible, null, null, null) {
    this.designNode = designNode;
  }

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLScreen.fromJson(json);
  factory PBDLScreen.fromJson(Map<String, dynamic> json) {
    return _$PBDLScreenFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$PBDLScreenToJson(this);
}
