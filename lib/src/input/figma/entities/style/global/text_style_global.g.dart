// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextStyleGlobal _$TextStyleGlobalFromJson(Map<String, dynamic> json) {
  return TextStyleGlobal(
    json['UUID'] as String,
    json['styleType'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
  )..textStyle = json['textStyle'] == null
      ? null
      : FigmaTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TextStyleGlobalToJson(TextStyleGlobal instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'description': instance.description,
      'styleType': instance.styleType,
      'textStyle': instance.textStyle?.toJson(),
    };
