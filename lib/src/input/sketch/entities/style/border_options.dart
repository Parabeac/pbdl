import 'package:json_annotation/json_annotation.dart';

part 'border_options.g.dart';

@JsonSerializable()
class BorderOptions {
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
