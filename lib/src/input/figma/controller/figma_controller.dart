//Responsive UI code

import 'package:pbdl/src/input/figma/entities/figma_key.dart';
import 'package:pbdl/src/input/figma/entities/layers/component.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_frame.dart';
import 'package:pbdl/src/input/figma/helper/api_call_service.dart';
import 'package:pbdl/src/input/figma/helper/figma_project.dart';
import 'package:pbdl/src/input/general_helper/azure_asset_service.dart';
import 'package:pbdl/src/util/main_info.dart';

class FigmaController {
  DesignType get designType => DesignType.FIGMA;

  String figmaProjectID;
  FigmaKey figmaAPIKey;

  Future<FigmaProject> convertFile(
    String projectID,
    FigmaKey figmaKey,
  ) async {
    figmaProjectID = projectID;
    figmaAPIKey = figmaKey;
    FigmaProject figmaProject;
    var jsonFigma = await _fetchFigmaFile();
    if (jsonFigma == null) {
      throw Error(); //todo: find correct error
    }
    AzureAssetService().projectUUID = figmaProjectID;
    MainInfo().projectName = jsonFigma['name'];
    MainInfo().figmaKey = figmaKey;
    MainInfo().figmaProjectID = projectID;
    figmaProject ??=
        generateFigmaTree(figmaProjectID, jsonFigma, MainInfo().projectName);
    figmaProject = declareScaffolds(figmaProject);

    await _sortPages(figmaProject);

    return figmaProject;
  }

  FigmaProject generateFigmaTree(
      var figmaProjectID, var jsonFigma, var projectName) {
    // try {
    return FigmaProject(
      projectName,
      jsonFigma,
      id: figmaProjectID,
    );
    // } catch (e, stackTrace) {
    //   print(e);
    //   return null;
    // }
  }

  Future<dynamic> _fetchFigmaFile() => APICallService.makeAPICall(
      'https://api.figma.com/v1/files/$figmaProjectID', figmaAPIKey);

  /// This method was required for Figma, so we could
  /// detect which `FigmaFrame` were Scaffolds or Containers
  FigmaProject declareScaffolds(FigmaProject tree) {
    for (var page in tree.pages) {
      for (var item in page.getPageItems()) {
        if (item.figmaNode is FigmaFrame) {
          (item.figmaNode as FigmaFrame).isRoot = true;
        }
      }
    }
    return tree;
  }

  /// Sorts project's pages so that Components are processed last
  Future<void> _sortPages(FigmaProject project) async {
    // Sort pages so that pages containing components are last
    project.pages.sort((a, b) {
      if (a.screens.any((screen) => screen.figmaNode is Component)) {
        return 1;
      } else if (b.screens.any((screen) => screen.figmaNode is Component)) {
        return -1;
      }
      return 0;
    });

    // Within each page, ensure screens that are components go last
    project.pages.forEach((page) {
      page.screens.sort((a, b) {
        if (a.figmaNode is Component) {
          return 1;
        } else if (b.figmaNode is Component) {
          return -1;
        }
        return 0;
      });
    });
  }
}
