import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_page.dart';
import 'package:pbdl/src/input/sketch/entities/style/shared_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';

part 'pbdl_project.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLProject implements PBDLNodeFactory, PBDLNode {
  bool debug = false;

  String pngPath;

  PBDLProject({
    this.name,
    this.UUID,
    this.pages,
    this.pngPath,
  }) {
    MainInfo().projectName = name ?? 'temp';
  }

  List<PBDLPage> pages = [];
  List<PBDLPage> miscPages = [];
  List<SharedStyle> sharedStyles = [];

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLProject.fromJson(json);
  factory PBDLProject.fromJson(Map<String, dynamic> json) =>
      _$PBDLProjectFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLProjectToJson(this);

  @override
  String UUID;

  @override
  var boundaryRectangle;

  @override
  PBDLNode child;

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;

  @override
  String type = 'project';
}
