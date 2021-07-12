import 'dart:io';

class MainInfo {
  static final MainInfo _singleton = MainInfo._internal();

  /// Path representing where the output of parabeac-core will be produced
  String outputPath; //move this one

  /// Current working directory; contains the path from where the script was called
  Directory cwd; //move this one
 
  /// API needed to do API callls
  String figmaKey; //move this one

  /// Project ID on Figma
  String figmaProjectID; //move this one

  String sketchPath;

  factory MainInfo() {
    return _singleton;
  }

  MainInfo._internal();
}
