import 'package:json_annotation/json_annotation.dart';

part 'pbdl_border_options.g.dart';

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
      _$PBDLBorderOptionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLBorderOptionsToJson(this);
}
