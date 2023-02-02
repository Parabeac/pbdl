import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/rectangle.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/src/input/figma/entities/style/fill/fill_type.dart';
import 'package:pbdl/src/input/figma/entities/style/fill/gradient_fill_type.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_color.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_gradient.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'fill_style_global.g.dart';

@JsonSerializable(explicitToJson: true)
class FillStyleGlobal extends GlobalStyleProperty {
  FillStyleGlobal(
    String UUID,
    String styleType, {
    String name,
    String description,
    var styleNode,
  }) : super(
          UUID,
          styleType,
          name: name,
          description: description,
          styleNode: styleNode,
        );

  @override
  Future<PBDLNode> interpretNode() async {
    if (styleNode == null) {
      return null;
    }
    if (styleNode is FigmaColor) {
      return PBDLGlobalColor(
        UUID,
        name,
        (styleNode as FigmaColor).interpretColor(),
        description: description,
      );
    } else if (styleNode is ImageFillType) {
      // TODO: figma Asset processor
      return PBDLGlobalImage(
        UUID,
        name,
        (styleNode as ImageFillType).interpretFill(),
        description: description,
      );
    } else if (styleNode is GradientFillType) {
      return PBDLGlobalGradient(
        UUID,
        name,
        (styleNode as GradientFillType).interpretFill(),
        description: description,
      );
    }
    return null;
  }

  Map<String, dynamic> toJson() => _$FillStyleGlobalToJson(this);

  factory FillStyleGlobal.fromJson(
      Map<String, dynamic> json, FigmaBaseNode styleNode) {
    if (styleNode is! FigmaRectangle) {
      return null;
    }
    var firstFill =
        (styleNode as FigmaRectangle).figmaStyleProperty.fills.first;
    var color = firstFill.color;

    var globalFill;
    if (color == null) {
      if (firstFill is GradientFillType) {
        globalFill = _$FillStyleGlobalFromJson(json)..styleNode = firstFill;
      } else if (firstFill is ImageFillType) {
        globalFill = _$FillStyleGlobalFromJson(json)..styleNode = firstFill;
      }
    } else {
      globalFill = _$FillStyleGlobalFromJson(json)..styleNode = color;
    }

    return globalFill;
  }
}
