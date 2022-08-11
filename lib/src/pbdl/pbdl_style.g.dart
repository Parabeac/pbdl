// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLStyle _$PBDLStyleFromJson(Map<String, dynamic> json) {
  return PBDLStyle(
    fills: (json['fills'] as List)
        ?.map((e) =>
            e == null ? null : PBDLFill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    borderOptions: json['borderOptions'] == null
        ? null
        : PBDLBorderOptions.fromJson(
            json['borderOptions'] as Map<String, dynamic>),
    textStyle: json['textStyle'] == null
        ? null
        : PBDLTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
    effects: (json['effects'] as List)
        ?.map((e) =>
            e == null ? null : PBDLEffect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clipsContent: json['clipsContent'] as bool,
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

Map<String, dynamic> _$PBDLStyleToJson(PBDLStyle instance) => <String, dynamic>{
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
      'fills': instance.fills?.map((e) => e?.toJson())?.toList(),
      'borderOptions': instance.borderOptions?.toJson(),
      'effects': instance.effects?.map((e) => e?.toJson())?.toList(),
      'textStyle': instance.textStyle?.toJson(),
      'clipsContent': instance.clipsContent,
      'pbdlType': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
