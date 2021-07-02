import 'package:pbdl/input/helper/pb_color.dart';
import 'package:pbdl/input/sketch/entities/style/border.dart';
import 'package:pbdl/input/sketch/entities/style/border_options.dart';
import 'package:pbdl/input/sketch/entities/style/color_controls.dart';
import 'package:pbdl/input/sketch/entities/style/context_settings.dart';
import 'package:pbdl/input/sketch/entities/style/fill.dart';
import 'package:pbdl/input/sketch/entities/style/text_style.dart';
import 'package:json_annotation/json_annotation.dart';

import 'blur.dart';

part 'style.g.dart';

@JsonSerializable()
class Style {
  @JsonKey(name: '_class')
  final String classField;
  @override
  @JsonKey(name: 'do_objectID')
  String UUID;
  final int endMarkerType, miterLimit, startMarkerType, windingRule;
  final Blur blur;
  @override
  final BorderOptions borderOptions;
  @override
  final List<Border> borders;
  final ColorControls colorControls;
  final ContextSettings contextSettings;
  List<Fill> fills, innerShadows, shadows;
  @JsonKey()
  TextStyle textStyle;

  Style({
    this.blur,
    this.borderOptions,
    this.borders,
    this.classField,
    this.colorControls,
    this.contextSettings,
    this.UUID,
    this.endMarkerType,
    List<Fill> this.fills,
    List<Fill> this.innerShadows,
    this.miterLimit,
    List<Fill> this.shadows,
    this.startMarkerType,
    this.windingRule,
    TextStyle this.textStyle,
  }) {
    if (shadows != null) {
      this.shadows = null;
      this.innerShadows = null;
      hasShadow = true;
    }
  }

  factory Style.fromJson(Map json) => _$StyleFromJson(json);
  Map<String, dynamic> toJson() => _$StyleToJson(this);

  @JsonKey(ignore: true)
  PBColor backgroundColor;

  @override
  @JsonKey(ignore: true)
  bool hasShadow;
}
