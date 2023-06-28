import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';

part 'figma_text_style.g.dart';

@JsonSerializable()
class FigmaTextStyle extends FigmaBaseNode {
  String? fontFamily;

  String? fontPostScriptName;

  @JsonKey(defaultValue: 0)
  num? paragraphSpacing;

  @JsonKey(defaultValue: 0)
  num? paragraphIndent;

  @JsonKey(defaultValue: 0)
  num? listSpacing;

  bool? italic;

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

  List<FigmaFill>? fills;

  String? hyperLink;

  @JsonKey(defaultValue: {})
  Map<String, num>? opentypeFlags;

  num? lineHeightPx;

  @JsonKey(defaultValue: 100)
  num? lineHeightPercent;

  num? lineHeightPercentFontSize;

  String? lineHeightUnit;

  FigmaTextStyle({
    this.fontFamily,
    this.fontPostScriptName,
    this.paragraphSpacing,
    this.paragraphIndent,
    this.listSpacing,
    this.italic,
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
  });

  Map<String, dynamic> toJson() => _$FigmaTextStyleToJson(this);
  factory FigmaTextStyle.fromJson(Map<String, dynamic> json) =>
      _$FigmaTextStyleFromJson(json);

  PBDLTextStyle interpretTextStyle() {
    return PBDLTextStyle(
      fontFamily: fontFamily,
      fontPostScriptName: fontPostScriptName,
      paragraphSpacing: paragraphSpacing,
      paragraphIndent: paragraphIndent,
      listSpacing: listSpacing,
      italics: italic,
      fontWeight: fontWeight,
      fontSize: fontSize,
      textCase: textCase,
      textDecoration: textDecoration,
      textAutoResize: textAutoResize,
      textAlignHorizontal: textAlignHorizontal,
      textAlignVertical: textAlignVertical,
      letterSpacing: letterSpacing,
      fills: fills?.map((fill) => fill.interpretFill()).toList(),
      hyperLink: hyperLink,
      opentypeFlags: opentypeFlags,
      lineHeightPx: lineHeightPx,
      lineHeightPercent: lineHeightPercent,
      lineHeightPercentFontSize: lineHeightPercentFontSize,
      lineHeightUnit: lineHeightUnit,
    );
  }

  @override
  Future<PBDLNode> interpretNode() {
    // TODO: implement interpretNode
    throw UnimplementedError();
  }
}
