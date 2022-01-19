import 'package:json_annotation/json_annotation.dart';

import 'figma_color.dart';

part 'figma_effect.g.dart';

@JsonSerializable()
class FigmaEffect {
  EffectType type;
  bool visible;
  num radius;
  FigmaColor color;
  String blendMode;
  Map offset;
  bool showShadowBehindNode;

  FigmaEffect({
    this.type,
    this.visible,
    this.radius,
    this.color,
    this.blendMode,
    this.offset,
    this.showShadowBehindNode,
  });

  Map<String, dynamic> toJson() => _$FigmaEffectToJson(this);
  factory FigmaEffect.fromJson(Map<String, dynamic> json) =>
      _$FigmaEffectFromJson(json);
}

enum EffectType {
  LAYER_BLUR,
  DROP_SHADOW,
  INNER_SHADOW,
  BACKGROUND_BLUR,
}
