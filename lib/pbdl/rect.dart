import 'package:json_annotation/json_annotation.dart';

part 'rect.g.dart';

@JsonSerializable()
class Rect {
  Rect(
    this.x,
    this.y,
    this.width,
    this.height,
  );

  double x;
  double y;
  double width;
  double height;

  @override
  factory Rect.fromJson(Map<String, dynamic> json) => _$RectFromJson(json);

  Map<String, dynamic> toJson() => _$RectToJson(this);
}
