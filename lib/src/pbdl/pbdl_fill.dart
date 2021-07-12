import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_fill.g.dart';

@JsonSerializable()
class PBDLFill {
  PBDLColor color;
  bool isEnabled;
  PBDLFill(this.color, [this.isEnabled = true]);

  @override
  factory PBDLFill.fromJson(Map<String, dynamic> json) =>
      _$PBDLFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFillToJson(this);
}
