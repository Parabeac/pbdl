import 'package:json_annotation/json_annotation.dart';
import 'gradient_stop.dart';

part 'gradient.g.dart';

@JsonSerializable()
class Gradient {
  @JsonKey(name: '_class')
  final String classField;
  final double elipseLength;
  final String from;
  final double gradientType;
  final String to;
  final List<GradientStop> stops;

  Gradient(
      {this.classField,
      this.elipseLength,
      this.from,
      this.gradientType,
      this.stops,
      this.to});

  factory Gradient.fromJson(Map json) => _$GradientFromJson(json);
  Map toJson() => _$GradientToJson(this);
}
