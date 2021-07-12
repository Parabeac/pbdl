// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLTextStyle _$PBDLTextStyleFromJson(Map<String, dynamic> json) {
  return PBDLTextStyle(
    fontColor: json['fontColor'] == null
        ? null
        : PBDLColor.fromJson(json['fontColor'] as Map<String, dynamic>),
    weight: json['weight'] as String,
    paragraphStyle: json['paragraphStyle'] == null
        ? null
        : PBDLParagraphStyle.fromJson(
            json['paragraphStyle'] as Map<String, dynamic>),
  )..fontDescriptor = json['fontDescriptor'] == null
      ? null
      : PBDLFontDescriptor.fromJson(
          json['fontDescriptor'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLTextStyleToJson(PBDLTextStyle instance) =>
    <String, dynamic>{
      'fontColor': instance.fontColor,
      'weight': instance.weight,
      'fontDescriptor': instance.fontDescriptor,
      'paragraphStyle': instance.paragraphStyle,
    };
