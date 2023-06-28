import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

import 'package:json_annotation/json_annotation.dart';

part 'pbdl_text_style.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLTextStyle extends PBDLNode {
  String? fontFamily;

  String? fontPostScriptName;

  @JsonKey(defaultValue: 0)
  num? paragraphSpacing;

  @JsonKey(defaultValue: 0)
  num? paragraphIndent;

  @JsonKey(defaultValue: 0)
  num? listSpacing;

  bool? italics;

  num? fontWeight;

  num? fontSize;

  @JsonKey(defaultValue: 'ORIGINAL')
  String? textCase;

  @JsonKey(defaultValue: 'NONE')
  String? textDecoration;

  @JsonKey(defaultValue: 'NONE')
  String? textAutoResize;

  String? textAlignHorizontal;

  String? textAlignVertical;

  num? letterSpacing;

  List<PBDLFill>? fills;

  String? hyperLink;

  @JsonKey(defaultValue: {})
  Map<String, num>? opentypeFlags;

  num? lineHeightPx;

  @JsonKey(defaultValue: 100)
  num? lineHeightPercent;

  num? lineHeightPercentFontSize;

  String? lineHeightUnit;

  @override
  final pbdlType = 'text_style';

  PBDLTextStyle({
    this.fontFamily,
    this.fontPostScriptName,
    this.paragraphSpacing,
    this.paragraphIndent,
    this.listSpacing,
    this.italics,
    this.fontWeight,
    this.fontSize,
    this.textCase,
    this.textDecoration,
    this.textAutoResize,
    this.textAlignHorizontal,
    this.textAlignVertical,
    this.letterSpacing,
    this.fills,
    this.hyperLink,
    this.opentypeFlags,
    this.lineHeightPx,
    this.lineHeightPercent,
    this.lineHeightPercentFontSize,
    this.lineHeightUnit,
  }) : super(
          '',
          '',
          false,
          null,
          null,
          '',
        );

  @override
  factory PBDLTextStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLTextStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLTextStyleToJson(this);
}
