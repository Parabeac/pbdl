// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBStyle _$PBStyleFromJson(Map<String, dynamic> json) {
  return PBStyle(
    fills: (json['fills'] as List)
        ?.map((e) =>
            e == null ? null : PBFill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    backgroundColor: json['backgroundColor'] == null
        ? null
        : PBColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
  )
    ..borders = (json['borders'] as List)
        ?.map((e) =>
            e == null ? null : PBBorder.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..borderOptions = json['borderOptions'] == null
        ? null
        : PBBorderOptions.fromJson(
            json['borderOptions'] as Map<String, dynamic>)
    ..textStyle = json['textStyle'] == null
        ? null
        : PBTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>)
    ..hasShadow = json['hasShadow'] as bool;
}

Map<String, dynamic> _$PBStyleToJson(PBStyle instance) => <String, dynamic>{
      'backgroundColor': instance.backgroundColor,
      'fills': instance.fills,
      'borders': instance.borders,
      'borderOptions': instance.borderOptions,
      'textStyle': instance.textStyle,
      'hasShadow': instance.hasShadow,
    };
