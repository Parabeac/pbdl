import 'package:pbdl/pbdl/pb_border.dart';
import 'package:pbdl/pbdl/pb_border_options.dart';
import 'package:pbdl/pbdl/pb_fill.dart';
import 'package:pbdl/pbdl/pb_text_style.dart';
import 'color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_style.g.dart';

@JsonSerializable()
class PBStyle {
  PBColor backgroundColor;
  List<PBFill> fills;
  List<PBBorder> borders;
  PBBorderOptions borderOptions;
  PBTextStyle textStyle;
  bool hasShadow = false;

  PBStyle({this.fills, this.backgroundColor});

  @override
  factory PBStyle.fromJson(Map<String, dynamic> json) =>
      _$PBStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBStyleToJson(this);
}
