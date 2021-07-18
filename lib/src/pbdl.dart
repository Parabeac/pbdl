import 'package:meta/meta.dart';
import 'package:pbdl/src/input/figma/controller/figma_controller.dart';
import 'package:pbdl/src/input/sketch/controller/sketch_controller.dart';
import 'package:pbdl/src/pbdl/pbdl_project.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/util/sketch/sac_installer.dart';
import 'package:path/path.dart' as p;

class PBDL {
  /// Method that creates and returns a [PBDLProject] from a Sketch file `path`
  static Future<PBDLProject> fromSketch(
    String sketchPath, {

    /// Absolute path to where pngs and JSON will be exported
    @required String outputPath,
  }) async {
    if (outputPath != null && outputPath.isNotEmpty) {
      MainInfo().outputPath = p.join(outputPath, 'pbdl_out');
    }

    await SACInstaller.installAndRun();

    var sketchProject = await SketchController().convertFile(sketchPath);

    return sketchProject.interpretNode();
  }

  /// Method that creates and returns a [PBDLProject] from figma `projectID` and `key`
  static Future<PBDLProject> fromFigma(
    String projectID,
    String key, {

    /// Absolute path to where pngs and JSON will be exported
    @required String outputPath,
  }) async {
    if (outputPath != null && outputPath.isNotEmpty) {
      MainInfo().outputPath = p.join(outputPath, 'pbdl_out');
    }
    var figmaProject = await FigmaController().convertFile(projectID, key);
    return await figmaProject.interpretNode();
  }
}
