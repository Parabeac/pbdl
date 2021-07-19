import 'dart:io';

import 'package:meta/meta.dart';
import 'package:pbdl/src/input/figma/controller/figma_controller.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/sketch/controller/sketch_controller.dart';
import 'package:pbdl/src/pbdl/pbdl_project.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/util/sketch/sac_installer.dart';
import 'package:path/path.dart' as p;

import 'dart:convert';

class PBDL {
  /// Method that creates and returns a [PBDLProject] from a Sketch file `path`
  static Future<PBDLProject> fromSketch(
    String sketchPath, {

    /// Absolute path to where pngs and JSON will be exported
    @required String outputPath,

    /// [bool] that indicates whether the pbdl file will be written to the `outputPath`
    bool exportPbdlJson = false,
  }) async {
    _setupMainInfo(
      outputPath,
      projectName: p.basename(sketchPath).replaceFirst('.sketch', ''),
    );

    await SACInstaller.installAndRun();

    var sketchProject = await SketchController().convertFile(sketchPath);

    var pbdlProject = await sketchProject.interpretNode();

    if (exportPbdlJson) {
      _writePbdlJson(pbdlProject);
    }

    return pbdlProject;
  }

  /// Method that creates and returns a [PBDLProject] from figma `projectID` and `key`
  static Future<PBDLProject> fromFigma(
    String projectID,
    String key, {

    /// Absolute path to where pngs and JSON will be exported
    @required String outputPath,

    /// [bool] that indicates whether the pbdl file will be written to the `outputPath`
    bool exportPbdlJson = false,
  }) async {
    _setupMainInfo(outputPath);

    var figmaProject = await FigmaController().convertFile(projectID, key);
    var pbdlProject = await figmaProject.interpretNode();

    await FigmaAssetProcessor().processImageQueue(writeAsFile: true);
    if (exportPbdlJson) {
      _writePbdlJson(pbdlProject);
    }

    return pbdlProject;
  }

  static void _setupMainInfo(
    String outputPath, {
    String projectName = 'temp',
  }) {
    MainInfo().projectName = projectName;
    MainInfo().cwd = Directory.current;
    if (outputPath != null && outputPath.isNotEmpty) {
      MainInfo().outputPath =
          p.normalize(p.absolute(p.join(outputPath, 'pbdl_out')));
    } else {
      MainInfo().outputPath = p.join(Directory.current.path, 'pbdl_out');
    }
    MainInfo().pngPath = p.absolute(p.join(MainInfo().outputPath, 'assets'));
  }

  /// Method that exports a `.json` file representing the [PBDLProject]
  /// onto the `outputPath` with which PBDL was initialized.
  static void _writePbdlJson(
    PBDLProject project,
  ) {
    var fileName = project.name;
    var outputPath = p.join(MainInfo().outputPath, '$fileName.json');
    if (File(outputPath).existsSync()) {
      outputPath = p.join(MainInfo().outputPath,
          '${fileName}_${DateTime.now().toIso8601String()}.json');
    }
    File(outputPath).createSync(recursive: true);
    File(outputPath).writeAsStringSync(json.encode(project.toJson()));
  }
}
