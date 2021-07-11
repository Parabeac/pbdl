import 'package:pbdl/src/pbdl/pbdl_border.dart';
import 'package:pbdl/src/pbdl/pbdl_border_options.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';
import 'pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_style.g.dart';

@JsonSerializable()
class PBDLStyle {
  PBDLColor backgroundColor;
  List<PBDLFill> fills;
  List<PBDLBorder> borders;
  PBDLBorderOptions borderOptions;
  PBDLTextStyle textStyle;
  bool hasShadow = false;

  PBDLStyle({this.fills, this.backgroundColor});

  @override
  factory PBDLStyle.fromJson(Map<String, dynamic> json) =>
      _$PBStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBStyleToJson(this);
}
