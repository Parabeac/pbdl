import 'package:pbdl/src/pbdl/pb_font_descriptor.dart';
import 'package:pbdl/src/pbdl/pb_paragraph_style.dart';

import 'color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_text_style.g.dart';

@JsonSerializable()
class PBTextStyle {
  PBColor fontColor;
  String weight;
  PBFontDescriptor fontDescriptor;
  PBParagraphStyle paragraphStyle;

  PBTextStyle({
    this.fontColor,
    this.weight,
    this.paragraphStyle,
  });

  @override
  factory PBTextStyle.fromJson(Map<String, dynamic> json) =>
      _$PBTextStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBTextStyleToJson(this);
}
