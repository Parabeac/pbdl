// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_fill_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientFillType _$GradientFillTypeFromJson(Map<String, dynamic> json) {
  return GradientFillType(
    gradientStops: (json['gradientStops'] as List)
        ?.map((e) =>
            e == null ? null : GradientStop.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gradientHandlePositions: GradientFillType._pointsFromJson(
        json['gradientHandlePositions'] as List<Map<dynamic, dynamic>>),
    type: json['type'] as String,
    blendMode: _$enumDecodeNullable(_$BlendModeEnumMap, json['blendMode']),
    visible: json['visible'] as bool,
    opacity: json['opacity'] as num,
  )..color = json['color'] == null
      ? null
      : FigmaColor.fromJson(json['color'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GradientFillTypeToJson(GradientFillType instance) =>
    <String, dynamic>{
      'gradientStops': instance.gradientStops,
      'gradientHandlePositions':
          GradientFillType._pointsToJson(instance.gradientHandlePositions),
      'color': instance.color,
      'type': instance.type,
      'blendMode': _$BlendModeEnumMap[instance.blendMode],
      'visible': instance.visible,
      'opacity': instance.opacity,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BlendModeEnumMap = {
  BlendMode.NORMAL: 'NORMAL',
  BlendMode.DARKEN: 'DARKEN',
  BlendMode.MULTIPLY: 'MULTIPLY',
  BlendMode.COLOR_BURN: 'COLOR_BURN',
  BlendMode.LIGHTEN: 'LIGHTEN',
  BlendMode.SCREEN: 'SCREEN',
  BlendMode.COLOR_DODGE: 'COLOR_DODGE',
  BlendMode.OVERLAY: 'OVERLAY',
  BlendMode.SOFT_LIGHT: 'SOFT_LIGHT',
  BlendMode.HARD_LIGHT: 'HARD_LIGHT',
  BlendMode.DIFFERENCE: 'DIFFERENCE',
  BlendMode.EXCLUSION: 'EXCLUSION',
  BlendMode.HUE: 'HUE',
  BlendMode.SATURATION: 'SATURATION',
  BlendMode.COLOR: 'COLOR',
  BlendMode.LUMINOSITY: 'LUMINOSITY',
};

GradientStop _$GradientStopFromJson(Map<String, dynamic> json) {
  return GradientStop(
    color: json['color'] == null
        ? null
        : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
    position: json['position'] as num,
  );
}

Map<String, dynamic> _$GradientStopToJson(GradientStop instance) =>
    <String, dynamic>{
      'color': instance.color,
      'position': instance.position,
    };
