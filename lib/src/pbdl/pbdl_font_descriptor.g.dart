// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_font_descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFontDescriptor _$PBDLFontDescriptorFromJson(Map<String, dynamic> json) {
  return PBDLFontDescriptor(
    fontName: json['fontName'] as String,
    fontSize: json['fontSize'] as num,
    rawAttributes: json['rawAttributes'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PBDLFontDescriptorToJson(PBDLFontDescriptor instance) =>
    <String, dynamic>{
      'rawAttributes': instance.rawAttributes,
      'fontName': instance.fontName,
      'fontSize': instance.fontSize,
    };