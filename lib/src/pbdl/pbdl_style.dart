import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style_property.dart';
import 'package:pbdl/src/pbdl/pbdl_border_options.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_effect.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';
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

  @JsonKey(ignore: true)
  PBDLColor blendedColor;

  PBDLStyle({
    this.fills,
    this.borderOptions,
    this.textStyle,
    this.effects,
  }) : super('', '', true, null, null, '') {
    blendedColor = _calculateBlendColor();
  }

  static PBDLStyle getStyle(dynamic style) {
    if (style is Map) {
      return PBDLStyle.fromJson(style);
    }
    return (style as FigmaStyleProperty).interpretStyle();
  }

  @override
  factory PBDLStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLStyleToJson(this);

  // Calculate just one color from all fills
  PBDLColor _calculateBlendColor() {
    var tempColor = [];
    if (fills.isNotEmpty) {
      fills.forEach((fill) {
        if (fill.type == 'SOLID') {
          if (tempColor.isEmpty) {
            tempColor = _colorToList(fill);
          } else {
            var temp = _colorToList(fill);
            tempColor = _addColors(tempColor, temp);
          }
        }
      });
      return PBDLColor(tempColor[3], tempColor[0], tempColor[1], tempColor[2]);
    } else {
      return null;
    }
  }

  // This method takes two PBDL Colors in list form and adds them
  List<double> _addColors(List<double> base, List<double> added) {
    var tempColor = <double>[];

    var calculatedAlpha = 1 - (1 - added[3]) * (1 - base[3]);

    tempColor.add(((added[0] / 2) + (base[0] / 2)).roundToDouble());
    tempColor.add(((added[1] / 2) + (base[1] / 2)).roundToDouble());
    tempColor.add(((added[2] / 2) + (base[2] / 2)).roundToDouble());
    tempColor.add(calculatedAlpha);

    return tempColor;
  }

  // Returns a pbdl fill to a list of double
  List<double> _colorToList(PBDLFill fill) {
    var alpha = _getAlpha(fill.opacity);
    var temp = <double>[];
    temp.add(fill.color.r);
    temp.add(fill.color.g);
    temp.add(fill.color.b);
    temp.add(alpha);
    return temp;
  }

  // Calculates the alpha of a fill
  double _getAlpha(num opacity) {
    if (opacity > 1) {
      return (opacity / 100).toDouble();
    } else {
      return opacity.toDouble();
    }
  }
}
