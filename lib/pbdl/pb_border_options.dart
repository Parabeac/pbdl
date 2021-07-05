import 'package:json_annotation/json_annotation.dart';

part 'pb_border_options.g.dart';

@JsonSerializable()
class PBBorderOptions {
  bool isEnabled;
  List dashPattern;
  int lineCapStyle, lineJoinStyle;

  PBBorderOptions({
    this.isEnabled,
    this.dashPattern,
    this.lineCapStyle,
    this.lineJoinStyle,
  });

  @override
  factory PBBorderOptions.fromJson(Map<String, dynamic> json) =>
      _$PBBorderOptionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBBorderOptionsToJson(this);
}
