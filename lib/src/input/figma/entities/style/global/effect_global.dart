import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/rectangle.dart';
import 'package:pbdl/src/input/figma/entities/layers/text.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_effect.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_effect.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'effect_global.g.dart';

@JsonSerializable(explicitToJson: true)
class EffectGlobal extends GlobalStyleProperty {
  EffectGlobal(
    String UUID,
    String styleType, {
    String name,
    String description,
    FigmaEffect styleNode,
  }) : super(
          UUID,
          styleType,
          name: name,
          description: description,
          styleNode: styleNode,
        );

  /// Contains the actual effect style value.

  @override
  Future<PBDLNode> interpretNode() async {
    if (styleNode == null) {
      return null;
    }
    return PBDLGlobalEffect(
      UUID,
      name,
      (styleNode as FigmaEffect).interpretEffect(),
      description: description,
    );
  }

  Map<String, dynamic> toJson() => _$EffectGlobalToJson(this);

  factory EffectGlobal.fromJson(
      Map<String, dynamic> json, FigmaBaseNode styleNode) {
    if (styleNode is! FigmaRectangle) {
      return null;
    }

    var firstEffect =
        (styleNode as FigmaRectangle).figmaStyleProperty.effects.first;

    final figmaNode = _$EffectGlobalFromJson(json)..styleNode = firstEffect;

    return figmaNode;
  }
}
