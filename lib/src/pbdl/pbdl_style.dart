import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style_property.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_effect.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_reference.dart';

part 'pbdl_style.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLStyle extends PBDLNode {
  List<PBDLFill> fills;
  PBDLBorderOptions borderOptions;
  List<PBDLEffect> effects;

  PBDLTextStyle textStyle;

  bool clipsContent;

  @override
  final pbdlType = 'style';

  PBDLStyle({
    this.fills,
    this.borderOptions,
    this.textStyle,
    this.effects,
    this.clipsContent,
  }) : super('', '', true, null, null, '');

  static PBDLStyle getStyle(dynamic style) {
    if (style is Map) {
      return PBDLStyle.fromJson(style);
    }
    return (style as FigmaStyleProperty)?.interpretStyle();
  }

  @override
  factory PBDLStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLStyleToJson(this);
}
