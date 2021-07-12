import 'package:pbdl/src/input/figma/controller/figma_controller.dart';
import 'package:pbdl/src/input/figma/helper/figma_project.dart';
import 'package:pbdl/src/input/sketch/controller/sketch_controller.dart';
import 'package:pbdl/src/pbdl/pbdl_page.dart';
import 'package:pbdl/src/input/sketch/entities/style/shared_style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/util/sketch/sac_installer.dart';

import 'abstract_pbdl_node_factory.dart';

part 'pbdl_project.g.dart';

@JsonSerializable()
class PBDLProject implements PBDLNodeFactory {
  String projectName;
  bool debug = false;
  String id;
  @override
  String pbdfType = 'project';

  String pngPath;

  PBDLProject({
    this.projectName,
    this.id,
    this.pngPath,
  }) {
    MainInfo().projectName = projectName ?? 'temp';
    MainInfo().pngPath = pngPath;
  }

  List<PBDLPage> pages = [];
  List<PBDLPage> miscPages = [];
  List<SharedStyle> sharedStyles = [];

  @override
  PBDLProject createPBDLNode(Map<String, dynamic> json) =>
      PBDLProject.fromJson(json);
  factory PBDLProject.fromJson(Map<String, dynamic> json) =>
      _$PBDLProjectFromJson(json);
  Map<String, dynamic> toJson() => _$PBDLProjectToJson(this);

  /// Method that creates and returns a [PBDLProject] from a Sketch file `path`
  static Future<PBDLProject> fromSketch(String path) async {
    await SACInstaller.installAndRun();

    var sketchProject = await SketchController().convertFile(path);

    // TODO: Open sketch file and interpret into PBDLProject
    return PBDLProject();
  }

  /// Method that creates and returns a [PBDLProject] from figma `projectID` and `key`
  static Future<PBDLProject> fromFigma(String projectID, String key) async {
    // TODO: Open figma project and interpret into PBDLProject

    var figmaProject = await FigmaController().convertFile(projectID, key);
    return PBDLProject();
  }
}
