import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

import 'blur.dart';
import 'border.dart';
import 'border_options.dart';
import 'color.dart';
import 'color_controls.dart';
import 'context_settings.dart';
import 'fill.dart';
import 'text_style.dart';

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

  PBDLStyle interpretStyle() {
    return PBDLStyle(
      backgroundColor: backgroundColor.interpretColor(),
      fills: fills.map((e) => e.interpretFill()).toList(),
      borders: borders.map((e) => e.interpretBorder()).toList(),
      borderOptions: borderOptions.interpretOptions(),
      textStyle: textStyle.interpretTextStyle(),
      hasShadow: hasShadow,
    );
  }

  @JsonKey(ignore: true)
  Color backgroundColor;

  @override
  @JsonKey(ignore: true)
  bool hasShadow;
}
