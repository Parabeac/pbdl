import 'dart:io';
import 'package:path/path.dart' as p;
import 'dart:convert';
import 'package:quick_log/quick_log.dart';

class SACInstaller {
  static Process process;

  static final Logger _log = Logger('SACInstaller');

  /// Since pbdl may be run as a git submodule, the path may change.
  static String pathToPBDL;

  static void _configurePathToPBDL() {
    pathToPBDL = Directory.current.path;

    // If current directory does not end in pbdl, it likely means
    // pbdl is being run as a submodule
    if (!pathToPBDL.endsWith('pbdl')) {
      pathToPBDL = p.join(pathToPBDL, 'pbdl');
    }
  }

  /// Method that installs the SAC submodule and its dependencies.
  ///
  /// Returns the exit code of the process as an `int`.
  static Future<int> installAndRun() async {
    _configurePathToPBDL();
    var installExitCode = await _installSubmodule();
    // Returning exit code if there was an error
    if (installExitCode != 0) {
      return installExitCode;
    }

    var installDepExitCode = await _installDependencies();
    // Returning exit code if there was an error
    if (installDepExitCode != 0) {
      return installDepExitCode;
    }

    // Return exit code to caller
    return await _runSAC();
  }

  /// Runs `install_sac_submodule.sh` which ensures the SAC submodule is installed.
  static Future<int> _installSubmodule() async {
    var pathToScript = p.join(pathToPBDL, 'tool', 'install_sac_submodule.sh');

    var install = await Process.start(pathToScript, [pathToPBDL]);

    await stdout.addStream(install.stdout);
    await stderr.addStream(install.stderr);
    return await install.exitCode;
  }

  /// Runs `install_sac_dependencies.sh` which ensures SAC's dependencies are installed.
  static Future<int> _installDependencies() async {
    var pathToScript =
        p.join(pathToPBDL, 'tool', 'install_sac_dependencies.sh');

    var install = await Process.start(pathToScript, [pathToPBDL]);

    await stdout.addStream(install.stdout);
    await stderr.addStream(install.stderr);
    return await install.exitCode;
  }

  static Future<int> _runSAC() async {
    process = await Process.start(
      'npm',
      ['run', 'prod'],
      workingDirectory: p.join(pathToPBDL, 'SketchAssetConverter'),
    );
    var exitCode = 1;

    await for (var event in process.stdout.transform(utf8.decoder)) {
      if (event.toLowerCase().contains('server is listening on port')) {
        exitCode = 0;
        _log.fine('SAC started successfully');
        break;
      } else if (event.toLowerCase().contains('error')) {
        exitCode = 1;
        _log.error(event);
        break;
      }
    }
    return exitCode;
  }
}
