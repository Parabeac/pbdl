// maybe we dont need this one anymore, or we might use it for PBDL

import 'package:pbdl/src/pbdl/abstract_design_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_page.dart';
import 'package:pbdl/src/input/sketch/entities/style/shared_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/util/sketch/sac_installer.dart';

part 'pbdl_project.g.dart';

@JsonSerializable()
class PBDLProject implements PBDLNodeFactory {
  String projectName;
  bool debug = false;
  String id;
  @override
  String pbdfType = 'project';

  PBDLProject({
    this.projectName,
    this.id,
  });

  List<PBDLPage> pages = [];
  List<PBDLPage> miscPages = [];
  List<SharedStyle> sharedStyles = [];

  @override
  PBDLProject createPBDLNode(Map<String, dynamic> json) =>
      PBDLProject.fromJson(json);
  factory PBDLProject.fromJson(Map<String, dynamic> json) =>
      _$PBDLProjectFromJson(json);
  Map<String, dynamic> toJson() => _$PBDLProjectToJson(this);
}
