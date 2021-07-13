import 'package:pbdl/src/pbdl/pbdl_project.dart';
import 'package:pbdl/src/util/sketch/sac_installer.dart';
import 'package:sentry/sentry.dart';

class PBDL {
  /// Method that creates and returns a [PBDLProject] from a Sketch file `path`
  static Future<PBDLProject> fromSketch(String path) async {
    await SACInstaller.installAndRun();
    await Sentry.init((options) => options.dsn =
        'https://a3d737214c3f4155b4e44bfd382e71d6@o433482.ingest.sentry.io/5863581');

    // TODO: Open sketch file and interpret into PBDLProject
    return PBDLProject();
  }

  /// Method that creates and returns a [PBDLProject] from figma `projectID` and `key`
  static Future<PBDLProject> fromFigma(String projectID, String key) async {
    await Sentry.init((options) => options.dsn =
        'https://a3d737214c3f4155b4e44bfd382e71d6@o433482.ingest.sentry.io/5863581');

    // TODO: Open figma project and interpret into PBDLProject
    return PBDLProject();
  }
}
