//no packages were imported

part 'figma_color.g.dart';

@JsonSerializable()
class FigmaColor implements PBColor {
  @override
  @JsonKey(name: 'a')
  double alpha;

  @override
  @JsonKey(name: 'b')
  double blue;

  @override
  @JsonKey(name: 'g')
  double green;

  @override
  @JsonKey(name: 'r')
  double red;

  FigmaColor({this.alpha, this.red, this.green, this.blue});

  @override
  Map<String, dynamic> toJson() => _$FigmaColorToJson(this);

  factory FigmaColor.fromJson(Map<String, dynamic> json) =>
      _$FigmaColorFromJson(json);
}
