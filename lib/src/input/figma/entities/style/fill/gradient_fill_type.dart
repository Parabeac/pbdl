import 'dart:math';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/style_addition.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import '../figma_color.dart';

part 'gradient_fill_type.g.dart';

@JsonSerializable()
class GradientFillType implements FigmaFill {
  List<GradientStop>? gradientStops;
  @JsonKey(fromJson: _pointsFromJson, toJson: _pointsToJson)
  List<Point> gradientHandlePositions;

  @override
  FigmaColor? color;

  @override
  String? type;

  @override
  String? blendMode;

  @override
  @JsonKey(defaultValue: true)
  bool? visible;

  @override
  @JsonKey(defaultValue: 100)
  num? opacity;

  GradientFillType({
    this.gradientStops,
    this.gradientHandlePositions = const [],
    this.blendMode,
    this.visible,
    this.opacity,
  });

  static List<Point> _pointsFromJson(List points) {
    var objPoints = <Point>[];
    for (var point in points) {
      objPoints.add(Point(point['x'], point['y']));
    }
    return objPoints;
  }

  static List<Map> _pointsToJson(List<Point> points) {
    var maps = <Map>[];
    for (var p in points) {
      maps.add({'x': p.x, 'y': p.y});
    }
    return maps;
  }

  factory GradientFillType.fromJson(Map<String, dynamic> json) =>
      _$GradientFillTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GradientFillTypeToJson(this);

  @override
  FigmaFill createFigmaFill(Map<String, dynamic>? json) =>
      GradientFillType.fromJson(json!);

  @override
  PBDLFill interpretFill() {
    return PBDLFill(
      opacity: opacity,
      blendMode: blendMode,
      type: type,
      isEnabled: visible,
      color: color?.interpretColor(),
      gradientStops: gradientStops!
          .map((gradientStop) => gradientStop.interpretGradientStop())
          .toList(),
      gradientHandlePositions: gradientHandlePositions,
    );
  }

  @override
  String addStyle(StyleAdditionNode style) {
    /// Any style added to GRADIENT returns IMAGE
    return 'IMAGE';
  }
}

@JsonSerializable()
class GradientStop {
  FigmaColor? color;
  num? position;

  GradientStop({
    this.color,
    this.position,
  });

  PBDLGradientStop interpretGradientStop() {
    return PBDLGradientStop(
      color: color!.interpretColor(),
      position: position,
    );
  }

  factory GradientStop.fromJson(Map<String, dynamic> json) =>
      _$GradientStopFromJson(json);

  Map<String, dynamic> toJson() => _$GradientStopToJson(this);
}
