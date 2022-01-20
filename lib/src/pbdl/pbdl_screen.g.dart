// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLScreen _$PBDLScreenFromJson(Map<String, dynamic> json) {
  return PBDLScreen(
    designNode: json['designNode'] == null
        ? null
        : PBDLNode.fromJson(json['designNode'] as Map<String, dynamic>),
    UUID: json['UUID'] as String,
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
  )
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
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
    ..convert = json['convert'] as bool
    ..imageURI = json['imageURI'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLScreenToJson(PBDLScreen instance) {
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
  writeNotNull('boundaryRectangle', instance.boundaryRectangle?.toJson());
  writeNotNull('style', instance.style?.toJson());
  writeNotNull('prototypeNodeUUID', instance.prototypeNodeUUID);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull('constraints', instance.constraints?.toJson());
  val['convert'] = instance.convert;
  val['imageURI'] = instance.imageURI;
  val['type'] = instance.type;
  val['designNode'] = instance.designNode?.toJson();
  val['isVisible'] = instance.isVisible;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
