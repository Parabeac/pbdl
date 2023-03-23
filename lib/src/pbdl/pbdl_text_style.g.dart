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
    ..masterPropertyReferences = json['masterPropertyReferences'] == null
        ? null
        : MasterPropertyReference.fromJson(
            json['masterPropertyReferences'] as Map<String, dynamic>)
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

Map<String, dynamic> _$PBDLTextStyleToJson(PBDLTextStyle instance) {
  final val = <String, dynamic>{
    'UUID': instance.UUID,
    'layoutMainAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
    'layoutCrossAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'masterPropertyReferences', instance.masterPropertyReferences?.toJson());
  val['name'] = instance.name;
  val['isVisible'] = instance.isVisible;
  val['boundaryRectangle'] = instance.boundaryRectangle?.toJson();
  val['style'] = instance.style?.toJson();
  val['prototypeNodeUUID'] = instance.prototypeNodeUUID;
  val['child'] = instance.child?.toJson();
  val['constraints'] = instance.constraints?.toJson();
  val['fontFamily'] = instance.fontFamily;
  val['fontPostScriptName'] = instance.fontPostScriptName;
  val['paragraphSpacing'] = instance.paragraphSpacing;
  val['paragraphIndent'] = instance.paragraphIndent;
  val['listSpacing'] = instance.listSpacing;
  val['italics'] = instance.italics;
  val['fontWeight'] = instance.fontWeight;
  val['fontSize'] = instance.fontSize;
  val['textCase'] = instance.textCase;
  val['textDecoration'] = instance.textDecoration;
  val['textAutoResize'] = instance.textAutoResize;
  val['textAlignHorizontal'] = instance.textAlignHorizontal;
  val['textAlignVertical'] = instance.textAlignVertical;
  val['letterSpacing'] = instance.letterSpacing;
  val['fills'] = instance.fills?.map((e) => e?.toJson())?.toList();
  val['hyperLink'] = instance.hyperLink;
  val['opentypeFlags'] = instance.opentypeFlags;
  val['lineHeightPx'] = instance.lineHeightPx;
  val['lineHeightPercent'] = instance.lineHeightPercent;
  val['lineHeightPercentFontSize'] = instance.lineHeightPercentFontSize;
  val['lineHeightUnit'] = instance.lineHeightUnit;
  val['pbdlType'] = instance.pbdlType;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
