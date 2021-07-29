import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';

import 'color.dart';
import 'context_settings.dart';
import 'gradient.dart';

part 'fill.g.dart';

@JsonSerializable()
class Fill {
  @JsonKey(name: '_class')
  final String classField;
  @override
  bool isEnabled;
  final int fillType;
  Color color;
  final ContextSettings contextSettings;
  final Gradient gradient;
  final int noiseIndex;
  final int noiseIntensity;
  final int patternFillType;
  final int patternTileScale;

  Fill(
      {this.classField,
      Color this.color,
      this.contextSettings,
      this.fillType,
      this.gradient,
      this.isEnabled,
      this.noiseIndex,
      this.noiseIntensity,
      this.patternFillType,
      this.patternTileScale});

  factory Fill.fromJson(Map json) => _$FillFromJson(json);
  Map toJson() => _$FillToJson(this);

  PBDLFill interpretFill() {
    return PBDLFill(color.interpretColor());
  }
}
