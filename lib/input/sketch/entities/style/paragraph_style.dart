import 'package:json_annotation/json_annotation.dart';

part 'paragraph_style.g.dart';

@JsonSerializable()
class ParagraphStyle {
  @override
  int alignment;

  ParagraphStyle({this.alignment});

  factory ParagraphStyle.fromJson(Map<String, dynamic> json) =>
      _$ParagraphStyleFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphStyleToJson(this);
}
