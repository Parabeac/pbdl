import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'text_style_global.g.dart';

@JsonSerializable(explicitToJson: true)
class TextStyleGlobal extends GlobalStyleProperty {
  TextStyleGlobal(
    String UUID,
    String styleType, {
    String name,
    String description,
  }) : super(UUID, styleType, name: name, description: description);

  /// Contains the actual text style value.
  FigmaTextStyle textStyle;

  @override
  Future<PBDLNode> interpretNode() async {
    if (textStyle == null) {
      return null;
    }
    return PBDLGlobalTextStyle(
      UUID,
      name,
      textStyle.interpretTextStyle(),
      description: description,
    );
  }

  Map<String, dynamic> toJson() => _$TextStyleGlobalToJson(this);

  factory TextStyleGlobal.fromJson(Map<String, dynamic> json) =>
      _$TextStyleGlobalFromJson(json);

  @override
  void populate(Map<String, dynamic> json) {
    if (json.containsKey('style')) {
      textStyle = FigmaTextStyle.fromJson(json['style']);
    }
  }
}
