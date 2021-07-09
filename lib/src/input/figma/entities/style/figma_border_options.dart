import 'package:json_annotation/json_annotation.dart';

part 'figma_border_options.g.dart';

@JsonSerializable()
class FigmaBorderOptions {
  List dashPattern;

  bool isEnabled;

  int lineCapStyle;

  int lineJoinStyle;

  FigmaBorderOptions(
    this.dashPattern,
    this.isEnabled,
    this.lineCapStyle,
    this.lineJoinStyle,
  );

  Map<String, dynamic> toJson() => _$FigmaBorderOptionsToJson(this);

  factory FigmaBorderOptions.fromJson(Map<String, dynamic> json) =>
      _$FigmaBorderOptionsFromJson(json);
}
