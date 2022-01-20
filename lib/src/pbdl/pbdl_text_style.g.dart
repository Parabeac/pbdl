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
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLTextStyleToJson(PBDLTextStyle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UUID', instance.UUID);
  writeNotNull('layoutMainAxisSizing',
      _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing]);
  writeNotNull('layoutCrossAxisSizing',
      _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing]);
  writeNotNull('name', instance.name);
  writeNotNull('isVisible', instance.isVisible);
  writeNotNull('boundaryRectangle', instance.boundaryRectangle?.toJson());
  writeNotNull('style', instance.style?.toJson());
  writeNotNull('prototypeNodeUUID', instance.prototypeNodeUUID);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull('constraints', instance.constraints?.toJson());
  val['fontColor'] = instance.fontColor?.toJson();
  val['weight'] = instance.weight;
  val['fontDescriptor'] = instance.fontDescriptor?.toJson();
  val['paragraphStyle'] = instance.paragraphStyle?.toJson();
  val['type'] = instance.type;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
