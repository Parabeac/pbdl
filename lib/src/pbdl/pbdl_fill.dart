import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_fill.g.dart';

@JsonSerializable()
class PBDLFill {
  PBDLColor color;
  bool isEnabled;
  PBDLFill(this.color, [this.isEnabled = true]);

  @override
  factory PBDLFill.fromJson(Map<String, dynamic> json) =>
      _$PBFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBFillToJson(this);
}
