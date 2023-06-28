import 'package:json_annotation/json_annotation.dart';

part 'pbdl_paragraph_style.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLParagraphStyle {
  PBDLParagraphStyle({this.alignment});
  int? alignment;

  final type = 'paragraph_style';

  factory PBDLParagraphStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLParagraphStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLParagraphStyleToJson(this);
}

enum ALIGNMENT {
  LEFT,
  RIGHT,
  CENTER,
  JUSTIFY,
}
