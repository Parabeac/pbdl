// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_effect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaEffect _$FigmaEffectFromJson(Map<String, dynamic> json) {
  return FigmaEffect(
    type: _$enumDecodeNullable(_$EffectTypeEnumMap, json['type']),
    visible: json['visible'] as bool,
    radius: json['radius'] as num,
    color: json['color'] == null
        ? null
        : FigmaColor.fromJson(json['color'] as Map<String, dynamic>),
    blendMode: json['blendMode'] as String,
    offset: json['offset'] as Map<String, dynamic>,
    showShadowBehindNode: json['showShadowBehindNode'] as bool,
  );
}

Map<String, dynamic> _$FigmaEffectToJson(FigmaEffect instance) =>
    <String, dynamic>{
      'type': _$EffectTypeEnumMap[instance.type],
      'visible': instance.visible,
      'radius': instance.radius,
      'color': instance.color,
      'blendMode': instance.blendMode,
      'offset': instance.offset,
      'showShadowBehindNode': instance.showShadowBehindNode,
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

const _$EffectTypeEnumMap = {
  EffectType.LAYER_BLUR: 'LAYER_BLUR',
  EffectType.DROP_SHADOW: 'DROP_SHADOW',
  EffectType.INNER_SHADOW: 'INNER_SHADOW',
  EffectType.BACKGROUND_BLUR: 'BACKGROUND_BLUR',
};
