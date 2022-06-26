import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/rectangle.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_color.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'fill_style_global.g.dart';

@JsonSerializable(explicitToJson: true)
class FillStyleGlobal extends GlobalStyleProperty {
  FillStyleGlobal(
    String UUID,
    String styleType, {
    String name,
    String description,
    FigmaColor styleNode,
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
    return PBDLGlobalColor(
      UUID,
      name,
      (styleNode as FigmaColor).interpretColor(),
      description: description,
    );
  }

  Map<String, dynamic> toJson() => _$FillStyleGlobalToJson(this);

  factory FillStyleGlobal.fromJson(
      Map<String, dynamic> json, FigmaBaseNode styleNode) {
    if (styleNode is! FigmaRectangle) {
      return null;
    }
    var color =
        (styleNode as FigmaRectangle).figmaStyleProperty.fills.first.color;
    var globalFill = _$FillStyleGlobalFromJson(json)..styleNode = color;

    return globalFill;
  }
}
