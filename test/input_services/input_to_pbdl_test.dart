import 'dart:io';
import 'package:pbdl/src/input/figma/controller/figma_controller.dart';
import 'package:pbdl/src/input/figma/helper/api_call_service.dart';
import 'package:pbdl/src/input/figma/helper/figma_page.dart';
import 'package:pbdl/src/input/figma/helper/figma_project.dart';
import 'package:pbdl/src/input/sketch/controller/sketch_controller.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_page.dart';
import 'package:pbdl/src/input/sketch/helper/sketch_project.dart';
import 'package:pbdl/src/input/sketch/services/input_design.dart';
import 'package:pbdl/src/util/main_info.dart';
import 'package:test/test.dart';

void main() {
  var figmaFileID = 'https://api.figma.com/v1/files/cmaAGe2hwCp7A5pmEQ2C80';
  var figmaAPIKey = Platform.environment['FIG_API_KEY'];
  group(
    'Input to PBDL test',
    () {
      var result;
      var outputPath;
      var ids;
      setUp(() async {
        outputPath = '${Directory.current.path}/temp/';
        MainInfo().outputPath = outputPath;

        /// For Figma input
        result = await APICallService.makeAPICall(figmaFileID, figmaAPIKey);

        MainInfo().pngPath = '${Directory.current.path}/temp/assets/';

        /// For Sketch Input
        ids = InputDesignService(
            '${Directory.current.path}/test/assets/parabeac_demo_alt.sketch');
      });
      test('Figma Test', () async {
        var figmaNodeTree = FigmaController()
            .generateFigmaTree('testUUID', result, 'testProject');

        expect(figmaNodeTree != null, true);
        expect(figmaNodeTree is FigmaProject, true);
        expect(figmaNodeTree.pages.isNotEmpty, true);
        expect(figmaNodeTree.pages[0] is FigmaPage, true);
      });
      test('Sketch Test', () {
        var sketchNodeTree = SketchController().generateSketchNodeTree(
            ids, ids.metaFileJson['pagesAndArtboards'], outputPath);

        expect(sketchNodeTree != null, true);
        expect(sketchNodeTree is SketchProject, true);
        expect(sketchNodeTree.pages.isNotEmpty, true);
        expect(sketchNodeTree.pages[0] is SketchPage, true);
      });
      tearDownAll(() {
        Process.runSync('${Directory.current.path}/test/assets/shell-proxy.sh',
            ['rm -rf $outputPath']);
      });
    },
    skip: !Platform.environment.containsKey('FIG_API_KEY'),
  );
}
