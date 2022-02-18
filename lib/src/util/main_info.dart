import 'dart:io';

import 'package:pbdl/src/input/figma/entities/figma_key.dart';

class MainInfo {
  static final MainInfo _singleton = MainInfo._internal();

  /// Path representing where the output of pbdl will be produced
  String outputPath;

  /// Current working directory; contains the path from where the script was called
  Directory cwd;

  /// APIkey needed to do API calls
  FigmaKey figmaKey;

  /// Project ID on Figma
  String figmaProjectID;

  String sketchPath;

  String projectName;

  String pngPath;

  factory MainInfo() {
    return _singleton;
  }

  MainInfo._internal();
}

enum DesignType { SKETCH, FIGMA, PBDL, UNKNOWN }
