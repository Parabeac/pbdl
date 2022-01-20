// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_shared_master_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLSharedMasterNode _$PBDLSharedMasterNodeFromJson(Map<String, dynamic> json) {
  return PBDLSharedMasterNode(
    UUID: json['UUID'] as String,
    overrideProperties: (json['overrideProperties'] as List)
        ?.map((e) => e == null
            ? null
            : PBDLOverrideProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    isVisible: json['isVisible'] as bool,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    style: json['style'],
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
    constraints: json['constraints'],
    symbolID: json['symbolID'] as String,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
    sharedNodeSetID: json['sharedNodeSetID'] as String,
    componentSetName: json['componentSetName'] as String,
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLSharedMasterNodeToJson(
    PBDLSharedMasterNode instance) {
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
  val['overrideProperties'] =
      instance.overrideProperties?.map((e) => e?.toJson())?.toList();
  val['children'] = instance.children?.map((e) => e?.toJson())?.toList();
  val['type'] = instance.type;
  val['componentSetName'] = instance.componentSetName;
  val['sharedNodeSetID'] = instance.sharedNodeSetID;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
