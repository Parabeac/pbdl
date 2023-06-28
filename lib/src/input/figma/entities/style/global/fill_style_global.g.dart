// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_style_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillStyleGlobal _$FillStyleGlobalFromJson(Map<String, dynamic> json) =>
    FillStyleGlobal(
      json['UUID'] as String?,
      json['styleType'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      styleNode: json['styleNode'] == null
          ? null
          : FigmaColor.fromJson(json['styleNode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FillStyleGlobalToJson(FillStyleGlobal instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'description': instance.description,
      'styleType': instance.styleType,
      'styleNode': instance.styleNode?.toJson(),
    };
