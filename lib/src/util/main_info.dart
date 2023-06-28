import 'dart:io';

import 'package:pbdl/src/input/figma/entities/figma_key.dart';
import 'package:pbdl/src/input/figma/integration/integration_strategy.dart';

class MainInfo {
  static final MainInfo _singleton = MainInfo._internal();

  /// Path representing where the output of pbdl will be produced
  late String outputPath;

  /// Current working directory; contains the path from where the script was called
  Directory? cwd;

  /// APIkey needed to do API calls
  FigmaKey? figmaKey;

  /// Project ID on Figma
  String? figmaProjectID;

  String? projectName;

  String? pngPath;

  late IntegrationStrategy integrationStrategy;

  factory MainInfo() {
    return _singleton;
  }

  MainInfo._internal();
}

enum DesignType { FIGMA, PBDL, UNKNOWN }
