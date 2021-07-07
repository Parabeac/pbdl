// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_font_descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBFontDescriptor _$PBFontDescriptorFromJson(Map<String, dynamic> json) {
  return PBFontDescriptor(
    fontName: json['fontName'] as String,
    fontSize: json['fontSize'] as num,
    rawAttributes: json['rawAttributes'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PBFontDescriptorToJson(PBFontDescriptor instance) =>
    <String, dynamic>{
      'rawAttributes': instance.rawAttributes,
      'fontName': instance.fontName,
      'fontSize': instance.fontSize,
    };
