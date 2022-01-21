// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaFill _$FigmaFillFromJson(Map<String, dynamic> json) {
  return FigmaFill(
    json['opacity'] as num ?? 100,
    _$enumDecodeNullable(_$BlendModeEnumMap, json['blendMode']),
    json['type'] as String,
    json['visible'] as bool ?? true,
  )..color = json['color'] == null
      ? null
      : FigmaColor.fromJson(json['color'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FigmaFillToJson(FigmaFill instance) => <String, dynamic>{
      'color': instance.color,
      'opacity': instance.opacity,
      'blendMode': _$BlendModeEnumMap[instance.blendMode],
      'type': instance.type,
      'visible': instance.visible,
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
