import 'dart:math';

import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../pbdl.dart';

part 'pbdl_fill.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFill {
  List<PBDLGradientStop>? gradientStops;
  @JsonKey(fromJson: _pointsFromJson, toJson: _pointsToJson)
  List<Point>? gradientHandlePositions;
  // String that tidentifies the ID of the image
  String? imageRef;

  PBDLColor? color;

  @JsonKey(defaultValue: 100)
  num? opacity;

  String? blendMode;

  String? type;

  @JsonKey(defaultValue: true)
  bool? isEnabled;

  final pbdlType = 'fill';

  PBDLFill({
    this.opacity,
    this.blendMode,
    this.type,
    this.isEnabled,
    this.color,
    this.imageRef,
    this.gradientStops,
    this.gradientHandlePositions,
  });

  static List<Point> _pointsFromJson(List points) {
    var objPoints = <Point>[];
    for (var point in points) {
      objPoints.add(Point(point['x'], point['y']));
    }
    return objPoints;
  }

  static List<Map> _pointsToJson(List<Point>? points) {
    var maps = <Map>[];
    if (points != null) {
      for (var p in points) {
        maps.add({'x': p.x, 'y': p.y});
      }
    }
    return maps;
  }

  @override
  factory PBDLFill.fromJson(Map<String, dynamic> json) =>
      _$PBDLFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFillToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PBDLGradientStop {
  PBDLColor? color;
  num? position;

  PBDLGradientStop({
    this.color,
    this.position,
  });

  factory PBDLGradientStop.fromJson(Map<String, dynamic> json) =>
      _$PBDLGradientStopFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLGradientStopToJson(this);
}
