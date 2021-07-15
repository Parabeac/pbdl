
import 'package:quick_log/quick_log.dart';

import 'main_info.dart';

class SketchController{
  ///SERVICE
  @override
  var log = Logger('SketchController');

  ///Converting the [fileAbsPath] sketch file to flutter
  @override
  void convertFile(
    var fileAbsPath,
    var projectPath,
    var configurationPath,
    var configType, {
    bool jsonOnly = false,
    DesignProject designProject,  //Ask Ivan
    AssetProcessingService apService,
  }) async {
    configure(configurationPath, configType);

    ///INTAKE
    var ids = InputDesignService(fileAbsPath, jsonOnly: jsonOnly);
    var sketchProject = generateSketchNodeTree(
        ids, ids.metaFileJson['pagesAndArtboards'], projectPath);

    AzureAssetService().projectUUID = sketchProject.id;

    await super.convertFile(
      fileAbsPath,
      projectPath,
      configurationPath,
      configType,
      designProject: sketchProject,
      jsonOnly: jsonOnly,
      apService: apService,
    );
  }

  SketchProject generateSketchNodeTree(
      InputDesignService ids, Map pagesAndArtboards, projectName) {
    try {
      return SketchProject(ids, pagesAndArtboards, projectName);
    } catch (e, stackTrace) {
      //MainInfo().sentry.captureException(
            exception: e,
            stackTrace: stackTrace,
          );
      log.error(e.toString());
      return null;
    }
  }
}
