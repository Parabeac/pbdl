import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_border.dart';
import 'color.dart';
import 'context_settings.dart';
import 'gradient.dart';

part 'border.g.dart';

@JsonSerializable()
class Border {
  @JsonKey(name: '_class')
  final String classField;

  final bool isEnabled;

  final double fillType;

  final Color color;
  final ContextSettings contextSettings;
  final Gradient gradient;
  final double position;

  final double thickness;

  Border(
      {this.classField,
      this.color,
      this.contextSettings,
      this.fillType,
      this.gradient,
      this.isEnabled,
      this.position,
      this.thickness});

  factory Border.fromJson(Map json) => _$BorderFromJson(json);
  Map toJson() => _$BorderToJson(this);

  PBDLBorder interpretBorder() {
    return PBDLBorder(
        // isEnabled: isEnabled,
        // fillType: fillType,
        // color: color?.interpretColor(),
        // thickness: thickness,
        );
  }
}
