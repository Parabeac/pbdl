import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pb_font_descriptor.dart';
import 'package:pbdl/pbdl/pb_paragraph_style.dart';

import 'color.dart';

abstract class PBTextStyle {
  PBColor fontColor;
  String weight;
  PBFontDescriptor fontDescriptor;
  PBParagraphStyle paragraphStyle;

  PBTextStyle({
    this.fontColor,
    this.weight,
    this.paragraphStyle,
  });

  toJson();
}
