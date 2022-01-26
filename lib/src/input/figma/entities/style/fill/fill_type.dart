import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'fill_type.g.dart';

@JsonSerializable()
class ImageFillType implements FigmaFill {
  // String that identifies the ID of the image
  String imageRef;

  @override
  String type = 'IMAGE';

  @override
  String blendMode;

  @override
  @JsonKey(defaultValue: true)
  bool visible;

  @override
  @JsonKey(defaultValue: 100)
  num opacity;

  @override
  FigmaColor color;

  ImageFillType({
    this.imageRef,
    this.blendMode,
    this.visible,
    this.opacity,
    this.color,
  });

  @override
  FigmaFill createFigmaFill(Map<String, dynamic> json) =>
      ImageFillType.fromJson(json);
  factory ImageFillType.fromJson(Map<String, dynamic> json) =>
      _$ImageFillTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageFillTypeToJson(this);

  @override
  PBDLFill interpretFill() {
    return PBDLFill(
      opacity: opacity,
      blendMode: blendMode,
      type: type,
      isEnabled: visible,
      color: color?.interpretColor(),
      imageRef: imageRef,
    );
  }
}

@JsonSerializable()
class SolidFillType implements FigmaFill {
  @override
  String type = 'SOLID';

  @override
  FigmaColor color;

  @override
  String blendMode;

  @override
  @JsonKey(defaultValue: true)
  bool visible;

  @override
  @JsonKey(defaultValue: 100)
  num opacity;

  SolidFillType({
    this.blendMode,
    this.visible,
    this.opacity,
  });

  @override
  FigmaFill createFigmaFill(Map<String, dynamic> json) =>
      SolidFillType.fromJson(json);

  factory SolidFillType.fromJson(Map<String, dynamic> json) =>
      _$SolidFillTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SolidFillTypeToJson(this);

  @override
  PBDLFill interpretFill() {
    return PBDLFill(
      opacity: opacity,
      blendMode: blendMode,
      type: type,
      isEnabled: visible,
      color: color.interpretColor(),
    );
  }
}
