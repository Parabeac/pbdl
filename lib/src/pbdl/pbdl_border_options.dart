import 'package:json_annotation/json_annotation.dart';

part 'pb_border_options.g.dart';

@JsonSerializable()
class PBDLBorderOptions {
  bool isEnabled;
  List dashPattern;
  int lineCapStyle, lineJoinStyle;

  PBDLBorderOptions({
    this.isEnabled,
    this.dashPattern,
    this.lineCapStyle,
    this.lineJoinStyle,
  });

  @override
  factory PBDLBorderOptions.fromJson(Map<String, dynamic> json) =>
      _$PBBorderOptionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBBorderOptionsToJson(this);
}
