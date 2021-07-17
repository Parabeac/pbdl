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
    fontDescriptor: json['fontDescriptor'] == null
        ? null
        : PBDLFontDescriptor.fromJson(
            json['fontDescriptor'] as Map<String, dynamic>),
  )
    ..pbdfType = json['pbdfType'] as String
    ..UUID = json['UUID'] as String
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..boundaryRectangle = json['boundaryRectangle']
    ..type = json['type'] as String
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PBDLTextStyleToJson(PBDLTextStyle instance) =>
    <String, dynamic>{
      'pbdfType': instance.pbdfType,
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle,
      'type': instance.type,
      'style': instance.style,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child,
      'fontColor': instance.fontColor,
      'weight': instance.weight,
      'fontDescriptor': instance.fontDescriptor,
      'paragraphStyle': instance.paragraphStyle,
    };
