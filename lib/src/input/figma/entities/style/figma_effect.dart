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
}

enum EffectType {LAYER_BLUR, DROP_SHADOW, INNER_SHADOW, BACKGROUND_BLUR,}