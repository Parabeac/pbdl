import 'package:pbdl/src/pbdl/color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pb_fill.g.dart';

@JsonSerializable()
class PBFill {
  PBColor color;
  bool isEnabled;
  PBFill(this.color, [this.isEnabled = true]);

  @override
  factory PBFill.fromJson(Map<String, dynamic> json) => _$PBFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBFillToJson(this);
}
