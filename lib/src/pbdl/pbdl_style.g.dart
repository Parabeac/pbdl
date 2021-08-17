// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLStyle _$PBDLStyleFromJson(Map<String, dynamic> json) {
  return PBDLStyle(
    fills: (json['fills'] as List)
        ?.map((e) =>
            e == null ? null : PBDLFill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backgroundColor: json['backgroundColor'] == null
        ? null
        : PBDLColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
    borders: (json['borders'] as List)
        ?.map((e) =>
            e == null ? null : PBDLBorder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    borderOptions: json['borderOptions'] == null
        ? null
        : PBDLBorderOptions.fromJson(
            json['borderOptions'] as Map<String, dynamic>),
    textStyle: json['textStyle'] == null
        ? null
        : PBDLTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
    hasShadow: json['hasShadow'] as bool,
  )
    ..isVisible = json['isVisible'] as bool
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLStyleToJson(PBDLStyle instance) => <String, dynamic>{
      'isVisible': instance.isVisible,
      'constraints': instance.constraints?.toJson(),
      'backgroundColor': instance.backgroundColor?.toJson(),
      'fills': instance.fills?.map((e) => e?.toJson())?.toList(),
      'borders': instance.borders?.map((e) => e?.toJson())?.toList(),
      'borderOptions': instance.borderOptions?.toJson(),
      'textStyle': instance.textStyle?.toJson(),
      'hasShadow': instance.hasShadow,
      'type': instance.type,
    };
