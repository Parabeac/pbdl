import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_fill.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFill {
  PBDLColor color;
  @JsonKey(defaultValue: true)
  bool isEnabled;
  PBDLFill(this.color, [this.isEnabled = true]);
  final type = 'fill';

  @override
  factory PBDLFill.fromJson(Map<String, dynamic> json) =>
      _$PBDLFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFillToJson(this);
}
