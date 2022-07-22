import 'dart:async';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/controller/figma_controller.dart';
import 'package:pbdl/src/input/figma/entities/figma_key.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_holder.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/sketch/controller/sketch_controller.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_asset_processor.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:pbdl/src/util/sketch/sac_installer.dart';
import 'package:path/path.dart' as p;

import 'dart:convert';

import 'input/general_helper/asset_processing_service.dart';
import 'input/general_helper/azure_asset_service.dart';

class PBDL {
  /// Method that creates and returns a [PBDLProject] from a Sketch file `path`
  static Future<PBDLProject> fromSketch(
    String sketchPath, {

    /// Absolute path to where JSON will be exported
    @required String outputPath,

    /// Absolute path to where pngs will be exported.
    /// If [null], will have the same path as `outputPath`
    String pngPath,

    /// [bool] that indicates whether the pbdl file will be written to the `outputPath`
    bool exportPbdlJson = false,
  }) async {
    return await runZonedGuarded(() async {
      if (pngPath == null || pngPath.isEmpty) {
        pngPath = outputPath;
      }

      _setupMainInfo(
        outputPath,
        pngPath,
        projectName: p.basename(sketchPath).replaceFirst('.sketch', ''),
      );

      MainInfo().sketchPath = sketchPath;

      await SACInstaller.installAndRun();

      var sketchProject = await SketchController().convertFile(sketchPath);

      var pbdl = await sketchProject.interpretNode();

      if (exportPbdlJson) {
        _writePbdlJson(pbdl);
      }

      if (Platform.environment.containsKey(AzureAssetService.KEY_NAME) &&
          exportPbdlJson) {
        _jsonToAzure(pbdl, SketchAssetProcessor());
      }

      SACInstaller.process.kill();

      return pbdl;
    }, (error, stackTrace) async {
      print(error.toString());
    });
  }

  /// Method that creates and returns a [PBDLProject] from figma `projectID` and `key`
  static Future<PBDLProject> fromFigma(
    String projectID, {
    String key,
    String oauthKey,

    /// Absolute path to where JSON will be exported
    @required String outputPath,

    /// Absolute path to where pngs will be exported.
    /// If [null], will have the same path as `outputPath`
    String pngPath,

    /// [bool] that indicates whether the pbdl file will be written to the `outputPath`
    bool exportPbdlJson = false,
    String projectName,
    String integrationStrategy = 'screen',
  }) async {
    return await runZonedGuarded(() async {
      final getIt = GetIt.instance;

      getIt.registerSingleton(GlobalStyleHolder());

      if (pngPath == null || pngPath.isEmpty) {
        pngPath = outputPath;
      }

      _setupMainInfo(outputPath, pngPath);
      var figmaKey = FigmaKey(personalAccessToken: key, oAuthToken: oauthKey);
      var figmaProject = await FigmaController().convertFile(
        projectID,
        figmaKey,
        integrationStrategy: integrationStrategy,
      );
      var pbdl = await figmaProject.interpretNode();

      // TODO: add services

      await FigmaAssetProcessor().processImageQueue(
          writeAsFile:
              !Platform.environment.containsKey(AzureAssetService.KEY_NAME));
      if (exportPbdlJson) {
        _writePbdlJson(pbdl, fileName: projectName);
      }

      // In order to upload the JSON file, the export PBDL to JSON flag must be on
      if (Platform.environment.containsKey(AzureAssetService.KEY_NAME) &&
          exportPbdlJson) {
        _jsonToAzure(pbdl, FigmaAssetProcessor());
      }

      return pbdl;
    }, (error, stackTrace) async {
      print(error.toString());
    });
  }

  static void _setupMainInfo(
    String outputPath,
    String pngPath, {
    String projectName = 'foo',
  }) {
    MainInfo().projectName = projectName;
    MainInfo().cwd = Directory.current;
    MainInfo().outputPath = _normalizedPath(outputPath);
    MainInfo().pngPath = _normalizedPath(pngPath);
  }

  /// Normalizes `absPath` if non-null and non-empty.
  /// Otherwise, returns current path
  static String _normalizedPath(String absPath) {
    if (absPath != null && absPath.isNotEmpty) {
      return p.normalize(p.absolute(p.join(absPath)));
    }
    return p.join(Directory.current.path);
  }

  /// Method that creates and returns a [PBDLProject] from json file
  static Future<PBDLProject> fromJson(
    Map<String, dynamic> json,
  ) async {
    return PBDLProject.fromJson(json);
  }

  static void _jsonToAzure(
      PBDLProject project, AssetProcessingService apService) async {
    var uuids = processRootNodeUUIDs(project, apService);
    // Process rootnode UUIDs
    await apService.processRootElements(uuids);
    project.name = MainInfo().projectName;
    var projectJson = project.toJson();
    projectJson['azure_container_uri'] = AzureAssetService().getContainerUri();
    var encodedJson = json.encode(projectJson);
    File('${verifyPath(MainInfo().outputPath)}${project.name}.json')
        .writeAsStringSync(encodedJson);
  }

  /// Method that returns the given path and ensures
  /// it ends with a /
  static String verifyPath(String path) {
    if (path.endsWith('/')) {
      return path;
    } else {
      return '$path/';
    }
  }

  /// Iterates through the [project] and returns a list of the UUIDs of the
  /// rootNodes
  static Map<String, Map> processRootNodeUUIDs(
      PBDLProject project, AssetProcessingService apService) {
    var result = <String, Map>{};

    for (var page in project.pages) {
      for (PBDLScreen screen in page.screens) {
        screen.imageURI = AzureAssetService().getImageURI('${screen.UUID}.png');
        result[screen.UUID] = {
          'width': screen.designNode.boundaryRectangle.width,
          'height': screen.designNode.boundaryRectangle.height
        };
      }
    }

    for (var page in project.miscPages) {
      for (PBDLScreen screen in page.screens) {
        result[screen.UUID] = {
          'width': screen.designNode.boundaryRectangle.width,
          'height': screen.designNode.boundaryRectangle.height
        };
      }
    }

    return result;
  }

  /// Method that exports a `.json` file representing the [PBDLProject]
  /// onto the `outputPath` with which PBDL was initialized.
  static void _writePbdlJson(
    PBDLProject project, {
    String fileName,
  }) {
    project.sortByUUID();
    fileName ??= project.name;
    var outputPath = p.join(MainInfo().outputPath, '$fileName.json');
    if (File(outputPath).existsSync()) {
      outputPath = p.join(MainInfo().outputPath,
          '${fileName}_${DateTime.now().toIso8601String()}.json');
    }
    File(outputPath).createSync(recursive: true);
    File(outputPath).writeAsStringSync(json.encode(project.toJson()));
  }
}
