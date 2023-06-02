import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material2_design.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_styles.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_page.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import 'abstract_pbdl_node_factory.dart';

part 'pbdl_project.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLProject extends PBDLNode implements PBDLNodeFactory {
  bool debug = false;

  String pngPath;

  DesignSystemThemeData designSystem;

  PBDLProject({
    String name,
    String UUID,
    this.pages,
    this.pngPath,
    this.globalStyles,
    this.designSystem,
  }) : super(UUID, name, true, null, null, null) {
    MainInfo().projectName = name ?? 'foo';
  }

  List<PBDLPage> pages = [];
  List<PBDLPage> miscPages = [];
  List<SharedStyle> sharedStyles = [];
  PBDLGlobalStyles globalStyles = PBDLGlobalStyles();

  int materialDesignCount() => designSystem.totalDesignCount;

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLProject.fromJson(json);
  factory PBDLProject.fromJson(Map<String, dynamic> json) =>
      _$PBDLProjectFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLProjectToJson(this);

  @override
  String pbdlType = 'project';

  @override
  void sortByUUID() {
    /// Sort [PBDLPage]s within this [PBDLProject]
    pages.sort();
    miscPages.sort();

    /// Ensure all [pages] sort their [screens]
    pages.forEach((page) => page.sortByUUID());
    miscPages.forEach((page) => page.sortByUUID());
  }
}
