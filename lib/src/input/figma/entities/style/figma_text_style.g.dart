// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaTextStyle _$FigmaTextStyleFromJson(Map<String, dynamic> json) =>
    FigmaTextStyle(
      fontFamily: json['fontFamily'] as String?,
      fontPostScriptName: json['fontPostScriptName'] as String?,
      paragraphSpacing: json['paragraphSpacing'] as num? ?? 0,
      paragraphIndent: json['paragraphIndent'] as num? ?? 0,
      listSpacing: json['listSpacing'] as num? ?? 0,
      italic: json['italic'] as bool?,
      fontWeight: json['fontWeight'] as num?,
      fontSize: json['fontSize'] as num?,
      textCase: json['textCase'] as String? ?? 'ORIGINAL',
      textDecoration: json['textDecoration'] as String? ?? 'NONE',
      textAutoResize: json['textAutoResize'] as String? ?? 'NONE',
      textAlignHorizontal: json['textAlignHorizontal'] as String?,
      textAlignVertical: json['textAlignVertical'] as String?,
      letterSpacing: json['letterSpacing'] as num?,
      fills: (json['fills'] as List<dynamic>?)
          ?.map((e) => FigmaFill.fromJson(e as Map<String, dynamic>?))
          .toList(),
      hyperLink: json['hyperLink'] as String?,
      opentypeFlags: (json['opentypeFlags'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as num),
          ) ??
          {},
      lineHeightPx: json['lineHeightPx'] as num?,
      lineHeightPercent: json['lineHeightPercent'] as num? ?? 100,
      lineHeightPercentFontSize: json['lineHeightPercentFontSize'] as num?,
      lineHeightUnit: json['lineHeightUnit'] as String?,
    );

Map<String, dynamic> _$FigmaTextStyleToJson(FigmaTextStyle instance) =>
    <String, dynamic>{
      'fontFamily': instance.fontFamily,
      'fontPostScriptName': instance.fontPostScriptName,
      'paragraphSpacing': instance.paragraphSpacing,
      'paragraphIndent': instance.paragraphIndent,
      'listSpacing': instance.listSpacing,
      'italic': instance.italic,
      'fontWeight': instance.fontWeight,
      'fontSize': instance.fontSize,
      'textCase': instance.textCase,
      'textDecoration': instance.textDecoration,
      'textAutoResize': instance.textAutoResize,
      'textAlignHorizontal': instance.textAlignHorizontal,
      'textAlignVertical': instance.textAlignVertical,
      'letterSpacing': instance.letterSpacing,
      'fills': instance.fills,
      'hyperLink': instance.hyperLink,
      'opentypeFlags': instance.opentypeFlags,
      'lineHeightPx': instance.lineHeightPx,
      'lineHeightPercent': instance.lineHeightPercent,
      'lineHeightPercentFontSize': instance.lineHeightPercentFontSize,
      'lineHeightUnit': instance.lineHeightUnit,
    };
