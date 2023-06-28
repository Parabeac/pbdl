// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_border_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBorderOptions _$PBDLBorderOptionsFromJson(Map<String, dynamic> json) =>
    PBDLBorderOptions(
      borders: (json['borders'] as List<dynamic>?)
          ?.map((e) => PBDLBorder.fromJson(e as Map<String, dynamic>))
          .toList(),
      strokeWeight: json['strokeWeight'] as num?,
      strokeAlign: json['strokeAlign'] as String?,
      strokeJoin: json['strokeJoin'] as String?,
      strokeDashes: json['strokeDashes'] as List<dynamic>?,
      cornerRadius: json['cornerRadius'] as num?,
    );

Map<String, dynamic> _$PBDLBorderOptionsToJson(PBDLBorderOptions instance) =>
    <String, dynamic>{
      'borders': instance.borders?.map((e) => e.toJson()).toList(),
      'strokeWeight': instance.strokeWeight,
      'strokeAlign': instance.strokeAlign,
      'strokeJoin': instance.strokeJoin,
      'strokeDashes': instance.strokeDashes,
      'cornerRadius': instance.cornerRadius,
    };
