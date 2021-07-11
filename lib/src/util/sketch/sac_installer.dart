import 'dart:io';
import 'package:path/path.dart' as p;
import 'dart:convert';
import 'package:quick_log/quick_log.dart';

class SACInstaller {
  static Logger log = Logger('SACInstaller');

  /// Method that installs the SAC submodule and its dependencies.
  ///
  /// Returns the exit code of the process as an `int`.
  static Future<int> installAndRun() async {
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

  static Future<int> _installSubmodule() async {
    var pathToScript =
        p.join(Directory.current.path, 'tool', 'install_sac_submodule.sh');
    var install = await Process.start(pathToScript, []);

    await stdout.addStream(install.stdout);
    await stderr.addStream(install.stderr);
    return await install.exitCode;
  }

  static Future<int> _installDependencies() async {
    var pathToScript =
        p.join(Directory.current.path, 'tool', 'install_sac_dependencies.sh');
    var install = await Process.start(pathToScript, []);

    await stdout.addStream(install.stdout);
    await stderr.addStream(install.stderr);
    return await install.exitCode;
  }

  static Future<int> _runSAC() async {
    var process = await Process.start(
      'npm',
      ['run', 'prod'],
      workingDirectory: p.join(Directory.current.path, 'SketchAssetConverter'),
    );
    var exitCode = 1;

    await for (var event in process.stdout.transform(utf8.decoder)) {
      if (event.toLowerCase().contains('server is listening on port')) {
        exitCode = 0;
        log.fine('SAC started successfully');
        break;
      } else if (event.toLowerCase().contains('error')) {
        exitCode = 1;
        log.error(event);
        break;
      }
    }
    process?.kill();
    return exitCode;
  }
}
