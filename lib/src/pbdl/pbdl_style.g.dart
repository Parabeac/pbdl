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
    backgroundColor: json['backgroundColor'] == null
        ? null
        : PBDLColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
    borders: (json['borders'] as List)
        ?.map((e) =>
            e == null ? null : PBDLBorder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    borderOptions: json['borderOptions'] == null
        ? null
        : PBDLBorderOptions.fromJson(
            json['borderOptions'] as Map<String, dynamic>),
    textStyle: json['textStyle'] == null
        ? null
        : PBDLTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
    hasShadow: json['hasShadow'] as bool,
  )
    ..pbdfType = json['pbdfType'] as String
    ..UUID = json['UUID'] as String
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLStyleToJson(PBDLStyle instance) => <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'backgroundColor': instance.backgroundColor?.toJson(),
      'fills': instance.fills?.map((e) => e?.toJson())?.toList(),
      'borders': instance.borders?.map((e) => e?.toJson())?.toList(),
      'borderOptions': instance.borderOptions?.toJson(),
      'textStyle': instance.textStyle?.toJson(),
      'hasShadow': instance.hasShadow,
      'type': instance.type,
    };
