import 'package:pbdl/pbdl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_effect.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLEffect {
  String? type;
  bool? visible;
  num? radius;
  PBDLColor? color;
  String? blendMode;
  Map? offset;
  bool? showShadowBehindNode;

  String? pbdlType = 'effect';

  PBDLEffect({
    this.type,
    this.visible,
    this.radius,
    this.color,
    this.blendMode,
    this.offset,
    this.showShadowBehindNode,
  });

  Map<String, dynamic> toJson() => _$PBDLEffectToJson(this);
  factory PBDLEffect.fromJson(Map<String, dynamic> json) =>
      _$PBDLEffectFromJson(json);
}

// enum EffectType {
//   LAYER_BLUR,
//   DROP_SHADOW,
//   INNER_SHADOW,
//   BACKGROUND_BLUR,
// }
