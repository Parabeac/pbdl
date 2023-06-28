// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_font_descriptor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFontDescriptor _$PBDLFontDescriptorFromJson(Map<String, dynamic> json) =>
    PBDLFontDescriptor(
      fontName: json['fontName'] as String?,
      fontSize: json['fontSize'] as num?,
      fontStyle: json['fontStyle'] as String?,
      fontWeight: json['fontWeight'] as String?,
      letterSpacing: json['letterSpacing'] as num?,
    );

Map<String, dynamic> _$PBDLFontDescriptorToJson(PBDLFontDescriptor instance) =>
    <String, dynamic>{
      'fontName': instance.fontName,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'fontStyle': instance.fontStyle,
      'letterSpacing': instance.letterSpacing,
    };
