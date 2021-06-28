//no need to import any packages

part 'figma_border_options.g.dart';

@JsonSerializable()
class FigmaBorderOptions implements PBBorderOptions {
  @override
  List dashPattern;

  @override
  bool isEnabled;

  @override
  int lineCapStyle;

  @override
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
