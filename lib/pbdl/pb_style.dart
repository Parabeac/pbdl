import 'package:pbdl/pbdl/pb_border.dart';
import 'package:pbdl/pbdl/pb_border_options.dart';
import 'package:pbdl/pbdl/pb_fill.dart';
import 'package:pbdl/pbdl/pb_text_style.dart';

import 'color.dart';

class PBStyle {
  PBColor backgroundColor;
  List<PBFill> fills;
  List<PBBorder> borders;
  PBBorderOptions borderOptions;
  PBTextStyle textStyle;
  bool hasShadow = false;

  PBStyle({this.fills, this.backgroundColor});

  // toPBDF() {}

  // factory PBStyle.fromPBDF(Map<String, dynamic> json) {
  //   if (json.containsKey('_class')) {
  //     return Style.fromJson(json);
  //   } else {
  //     return FigmaStyle.fromJson(json);
  //   }
  // }

  toJson() {}
}
