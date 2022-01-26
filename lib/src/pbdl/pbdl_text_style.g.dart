// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLTextStyle _$PBDLTextStyleFromJson(Map<String, dynamic> json) {
  return PBDLTextStyle(
    fontFamily: json['fontFamily'] as String,
    fontPostScriptName: json['fontPostScriptName'] as String,
    paragraphSpacing: json['paragraphSpacing'] as num ?? 0,
    paragraphIndent: json['paragraphIndent'] as num ?? 0,
    listSpacing: json['listSpacing'] as num ?? 0,
    italics: json['italics'] as bool,
    fontWeight: json['fontWeight'] as num,
    fontSize: json['fontSize'] as num,
    textCase: json['textCase'] as String ?? 'ORIGINAL',
    textDecoration: json['textDecoration'] as String ?? 'NONE',
    textAutoResize: json['textAutoResize'] as String ?? 'NONE',
    textAlignHorizontal: json['textAlignHorizontal'] as String,
    textAlignVertical: json['textAlignVertical'] as String,
    letterSpacing: json['letterSpacing'] as num,
    fills: (json['fills'] as List)
        ?.map((e) =>
            e == null ? null : PBDLFill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hyperLink: json['hyperLink'] as String,
    opentypeFlags: (json['opentypeFlags'] as Map<String, dynamic>)?.map(
          (k, e) => MapEntry(k, e as num),
        ) ??
        {},
    lineHeightPx: json['lineHeightPx'] as num,
    lineHeightPercent: json['lineHeightPercent'] as num ?? 100,
    lineHeightPercentFontSize: json['lineHeightPercentFontSize'] as num,
    lineHeightUnit: json['lineHeightUnit'] as String,
  )
    ..UUID = json['UUID'] as String
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>)
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLTextStyleToJson(PBDLTextStyle instance) =>
    <String, dynamic>{
      'UUID': instance.UUID,
      'layoutMainAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
      'layoutCrossAxisSizing':
          _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'fontFamily': instance.fontFamily,
      'fontPostScriptName': instance.fontPostScriptName,
      'paragraphSpacing': instance.paragraphSpacing,
      'paragraphIndent': instance.paragraphIndent,
      'listSpacing': instance.listSpacing,
      'italics': instance.italics,
      'fontWeight': instance.fontWeight,
      'fontSize': instance.fontSize,
      'textCase': instance.textCase,
      'textDecoration': instance.textDecoration,
      'textAutoResize': instance.textAutoResize,
      'textAlignHorizontal': instance.textAlignHorizontal,
      'textAlignVertical': instance.textAlignVertical,
      'letterSpacing': instance.letterSpacing,
      'fills': instance.fills?.map((e) => e?.toJson())?.toList(),
      'hyperLink': instance.hyperLink,
      'opentypeFlags': instance.opentypeFlags,
      'lineHeightPx': instance.lineHeightPx,
      'lineHeightPercent': instance.lineHeightPercent,
      'lineHeightPercentFontSize': instance.lineHeightPercentFontSize,
      'lineHeightUnit': instance.lineHeightUnit,
      'pbdlType': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
