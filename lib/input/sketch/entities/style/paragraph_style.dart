//no proposed solution
part 'paragraph_style.g.dart';

@JsonSerializable(nullable: true)
class ParagraphStyle implements PBParagraphStyle {
  @override
  int alignment;

  ParagraphStyle({this.alignment});

  factory ParagraphStyle.fromJson(Map<String, dynamic> json) =>
      _$ParagraphStyleFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphStyleToJson(this);
}
