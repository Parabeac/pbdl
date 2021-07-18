import 'dart:io';

class MainInfo {
  static final MainInfo _singleton = MainInfo._internal();

  /// Path representing where the output of pbdl will be produced
  String outputPath;

  /// Current working directory; contains the path from where the script was called
  Directory cwd;

  /// API needed to do API callls
  String figmaKey;

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
