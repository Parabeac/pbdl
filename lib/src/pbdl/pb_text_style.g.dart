// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBTextStyle _$PBTextStyleFromJson(Map<String, dynamic> json) {
  return PBTextStyle(
    fontColor: json['fontColor'] == null
        ? null
        : PBColor.fromJson(json['fontColor'] as Map<String, dynamic>),
    weight: json['weight'] as String,
    paragraphStyle: json['paragraphStyle'] == null
        ? null
        : PBParagraphStyle.fromJson(
            json['paragraphStyle'] as Map<String, dynamic>),
  )..fontDescriptor = json['fontDescriptor'] == null
      ? null
      : PBFontDescriptor.fromJson(
          json['fontDescriptor'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBTextStyleToJson(PBTextStyle instance) =>
    <String, dynamic>{
      'fontColor': instance.fontColor,
      'weight': instance.weight,
      'fontDescriptor': instance.fontDescriptor,
      'paragraphStyle': instance.paragraphStyle,
    };
