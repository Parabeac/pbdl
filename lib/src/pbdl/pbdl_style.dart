import 'package:pbdl/src/pbdl/pbdl_border.dart';
import 'package:pbdl/src/pbdl/pbdl_border_options.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_effect.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';
import 'pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_style.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLStyle extends PBDLNode {
  List<PBDLFill> fills;
  PBDLBorderOptions borderOptions;
  List<PBDLEffect> effects;

  PBDLTextStyle textStyle;

  @override
  final pbdlType = 'style';

  PBDLStyle({
    this.fills,
    this.borderOptions,
    this.textStyle,
    this.effects,
  }) : super('', '', true, null, null, '');

  static PBDLStyle getStyle(dynamic style) {
    if (style is Map) {
      return PBDLStyle.fromJson(style);
    }
    return style;
  }

  @override
  factory PBDLStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLStyleToJson(this);
}
