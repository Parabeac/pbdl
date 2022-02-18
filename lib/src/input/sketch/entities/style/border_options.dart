import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_border_options.dart';

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
  int lineCapStyle;
  String lineJoinStyle;

  BorderOptions(
    this.classField,
    this.dashPattern,
    this.isEnabled,
    this.lineCapStyle,
    this.lineJoinStyle,
  );

  factory BorderOptions.fromJson(Map json) => _$BorderOptionsFromJson(json);
  Map toJson() => _$BorderOptionsToJson(this);

  PBDLBorderOptions interpretOptions() {
    return PBDLBorderOptions(
      isEnabled: isEnabled,
      dashPattern: dashPattern,
      lineCapStyle: lineCapStyle,
      lineJoinStyle: lineJoinStyle,
    );
  }
}
