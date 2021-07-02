import 'package:pbdl/pbdl/color.dart';

abstract class PBFill {
  PBColor color;
  bool isEnabled;
  PBFill(this.color, [this.isEnabled = true]);

  toJson();
}
