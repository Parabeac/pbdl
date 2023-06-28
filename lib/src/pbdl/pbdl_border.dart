import 'pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_border.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLBorder {
  String? blendMode;

  String? type;

  PBDLColor? color;

  @JsonKey(defaultValue: true)
  bool? visible;

  final pbdlType = 'border';

  PBDLBorder({
    this.blendMode,
    this.type,
    this.color,
    this.visible,
  });

  factory PBDLBorder.fromJson(Map<String, dynamic> json) {
    return _$PBDLBorderFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() => _$PBDLBorderToJson(this);
}
