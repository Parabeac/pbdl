//nothing to import
part 'border_options.g.dart';

@JsonSerializable(nullable: true)
class BorderOptions implements PBBorderOptions {
  @JsonKey(name: '_class')
  String classField;
  @override
  bool isEnabled;
  @override
  List dashPattern;
  @override
  int lineCapStyle, lineJoinStyle;

  BorderOptions(
    this.classField,
    this.dashPattern,
    this.isEnabled,
    this.lineCapStyle,
    this.lineJoinStyle,
  );

  factory BorderOptions.fromJson(Map json) => _$BorderOptionsFromJson(json);
  Map toJson() => _$BorderOptionsToJson(this);
}
