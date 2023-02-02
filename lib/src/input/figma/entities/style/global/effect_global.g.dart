// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectGlobal _$EffectGlobalFromJson(Map<String, dynamic> json) {
  return EffectGlobal(
    json['UUID'] as String,
    json['styleType'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    styleNode: json['styleNode'] == null
        ? null
        : FigmaEffect.fromJson(json['styleNode'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EffectGlobalToJson(EffectGlobal instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'description': instance.description,
      'styleType': instance.styleType,
      'styleNode': instance.styleNode,
    };
