import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/text.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'text_style_global.g.dart';

@JsonSerializable(explicitToJson: true)
class TextStyleGlobal extends GlobalStyleProperty {
  TextStyleGlobal(
    String? UUID,
    String? styleType, {
    String? name,
    String? description,
    FigmaTextStyle? styleNode,
  }) : super(
          UUID,
          styleType,
          name: name,
          description: description,
          styleNode: styleNode,
        );

  /// Contains the actual text style value.

  @override
  Future<PBDLNode?> interpretNode() async {
    if (styleNode == null) {
      return null;
    }
    return PBDLGlobalTextStyle(
      UUID!,
      name,
      (styleNode as FigmaTextStyle).interpretTextStyle(),
      description: description,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$TextStyleGlobalToJson(this);

  factory TextStyleGlobal.fromJson(
      Map<String, dynamic> json, FigmaBaseNode styleNode) {
    if (styleNode is! FigmaText) {
      throw Exception('StyleNode must be a [FigmaText]');
    }
    final textStyle = styleNode.style;
    final figmaNode = _$TextStyleGlobalFromJson(json)..styleNode = textStyle;

    return figmaNode;
  }
}
