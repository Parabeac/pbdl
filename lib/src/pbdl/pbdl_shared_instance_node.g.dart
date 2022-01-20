// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_shared_instance_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLSharedInstanceNode _$PBDLSharedInstanceNodeFromJson(
    Map<String, dynamic> json) {
  return PBDLSharedInstanceNode(
    UUID: json['UUID'] as String,
    overrideValues: (json['overrideValues'] as List)
        ?.map((e) => e == null
            ? null
            : PBDLOverrideValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    style: json['style'],
    symbolID: json['symbolID'] as String,
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
    sharedNodeSetID: json['sharedNodeSetID'] as String,
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..parameters = json['parameters'] as List
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLSharedInstanceNodeToJson(
    PBDLSharedInstanceNode instance) {
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
  val['symbolID'] = instance.symbolID;
  val['parameters'] = instance.parameters;
  val['overrideValues'] =
      instance.overrideValues?.map((e) => e?.toJson())?.toList();
  val['sharedNodeSetID'] = instance.sharedNodeSetID;
  val['type'] = instance.type;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
