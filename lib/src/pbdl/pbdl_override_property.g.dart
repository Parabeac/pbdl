// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_override_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLOverrideProperty _$PBDLOverridePropertyFromJson(Map<String, dynamic> json) {
  return PBDLOverrideProperty(
    json['UUID'] as String,
    json['name'] as String,
    json['ovrType'],
    json['value'] == null
        ? null
        : PBDLNode.fromJson(json['value'] as Map<String, dynamic>),
  )
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
    ..masterPropertyReferences = json['masterPropertyReferences'] == null
        ? null
        : MasterPropertyReference.fromJson(
            json['masterPropertyReferences'] as Map<String, dynamic>)
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..constraints = json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLOverridePropertyToJson(
    PBDLOverrideProperty instance) {
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
  val['child'] = instance.child?.toJson();
  val['constraints'] = instance.constraints?.toJson();
  val['value'] = instance.value?.toJson();
  val['pbdlType'] = instance.pbdlType;
  val['ovrType'] = instance.ovrType;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
