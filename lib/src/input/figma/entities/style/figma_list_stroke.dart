import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/src/input/figma/entities/style/style_addition.dart';
import 'package:pbdl/src/pbdl/pbdl_border.dart';

part 'figma_list_stroke.g.dart';

@JsonSerializable()
class FigmaListStroke implements StyleAdditionNode {
  String? blendMode;

  @override
  String? type;

  FigmaColor? color;

  @JsonKey(defaultValue: true)
  bool? visible;

  FigmaListStroke({
    this.blendMode,
    this.type,
    this.color,
  });

  PBDLBorder interpretStroke() {
    return PBDLBorder(
      blendMode: blendMode,
      type: type,
      color: color?.interpretColor(),
      visible: visible,
    );
  }

  Map<String, dynamic> toJson() => _$FigmaListStrokeToJson(this);
  factory FigmaListStroke.fromJson(Map<String, dynamic> json) =>
      _$FigmaListStrokeFromJson(json);

  @override
  String addStyle(StyleAdditionNode style) {
    /// TODO: separate borders into separate classes
    if (type == 'SOLID') {
      if (style.type == 'SOLID') {
        return 'SOLID';
      }
      return 'IMAGE';
    } else {
      return 'IMAGE';
    }
  }
}
