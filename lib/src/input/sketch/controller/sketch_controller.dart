import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:pbdl/src/input/general_helper/azure_asset_service.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_project.dart';
import 'package:pbdl/src/input/sketch/services/input_design.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:quick_log/quick_log.dart';

class SketchController {
  var log;
  SketchController() {
    log = Logger(runtimeType.toString());
  }
  DesignType get designType => DesignType.SKETCH;

  String sketchPath;

  Future<SketchProject> convertFile(String sketchPath) async {
    var sketchProject;
    this.sketchPath = sketchPath;

    ///INTAKE
    var ids = InputDesignService(sketchPath);
    sketchProject ??= generateSketchNodeTree(
        ids, ids.metaFileJson['pagesAndArtboards'], MainInfo().projectName);

    AzureAssetService().projectUUID = sketchProject.id;

    return sketchProject;
  }

  SketchProject generateSketchNodeTree(
      InputDesignService ids, Map pagesAndArtboards, projectName) {
    try {
      return SketchProject(ids, pagesAndArtboards, projectName);
    } catch (e, stackTrace) {
      // MainInfo().sentry.captureException(
      //       exception: e,
      //       stackTrace: stackTrace,
      //     );
      log.error(e.toString());
      return null;
    }
  }

  Future<void> setup() async {
    if (!FileSystemEntity.isFileSync(sketchPath)) {
      throw Error();
    }
    InputDesignService(sketchPath);
    await checkSACVersion();
  }

  Future<void> checkSACVersion() async {
    /// Code is moved from `main.dart`
    Process process;
    if (!Platform.environment.containsKey('SAC_ENDPOINT')) {
      var isSACupToDate = await Process.run(
        './pb-scripts/check-git.sh',
        [],
        workingDirectory: MainInfo().cwd.path,
      );

      if (isSACupToDate.stdout
          .contains('Sketch Asset Converter is behind master.')) {
        log.warning(isSACupToDate.stdout);
      } else {
        log.info(isSACupToDate.stdout);
      }

      process = await Process.start('npm', ['run', 'prod'],
          workingDirectory:
              p.join(MainInfo().cwd.path, 'SketchAssetConverter'));

      await for (var event in process.stdout.transform(utf8.decoder)) {
        if (event.toLowerCase().contains('server is listening on port')) {
          log.fine('Successfully started Sketch Asset Converter');
          break;
        }
      }
      var b = process?.kill();
    }
  }
}
