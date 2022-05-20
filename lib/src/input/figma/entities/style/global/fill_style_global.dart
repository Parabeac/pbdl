import 'package:json_annotation/json_annotation.dart';
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
  }) : super(UUID, styleType, name: name, description: description);

  FigmaColor color;

  @override
  Future<PBDLNode> interpretNode() async {
    if (color == null) {
      return null;
    }
    return PBDLGlobalColor(
      UUID,
      name,
      color.interpretColor(),
      description: description,
    );
  }

  Map<String, dynamic> toJson() => _$FillStyleGlobalToJson(this);

  factory FillStyleGlobal.fromJson(Map<String, dynamic> json) =>
      _$FillStyleGlobalFromJson(json);
}
