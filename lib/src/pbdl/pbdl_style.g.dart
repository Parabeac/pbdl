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
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLStyleToJson(PBDLStyle instance) {
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
  writeNotNull('constraints', instance.constraints?.toJson());
  val['backgroundColor'] = instance.backgroundColor?.toJson();
  val['fills'] = instance.fills?.map((e) => e?.toJson())?.toList();
  val['borders'] = instance.borders?.map((e) => e?.toJson())?.toList();
  val['borderOptions'] = instance.borderOptions?.toJson();
  val['textStyle'] = instance.textStyle?.toJson();
  val['hasShadow'] = instance.hasShadow;
  val['type'] = instance.type;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
