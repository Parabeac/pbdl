import 'dart:io';
import 'package:path/path.dart' as p;
import 'dart:convert';

class SACInstaller {
  /// Method that installs the SAC submodule and its dependencies.
  ///
  /// Returns the exit code of the process as an `int`.
  static Future<int> installSAC() async {
    var installExitCode = await _installSubmodule();
    // If `installExitCode` is not successful, return exit code
    if (installExitCode != 0) {
      return installExitCode;
    }
    // Return exit code to caller
    return await _installDependencies();
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
    // TODO: Find a way to check if SAC did not run correctly.
    var process = await Process.start('npm', ['run', 'prod'],
        workingDirectory:
            p.join(Directory.current.path, 'SketchAssetConverter'));

    await for (var event in process.stdout.transform(utf8.decoder)) {
      if (event.toLowerCase().contains('server is listening on port')) {
        return 0;
      }
    }
    process?.kill();
    return 0;
  }
}
