// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_global_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLGlobalColor _$PBDLGlobalColorFromJson(Map<String, dynamic> json) {
  return PBDLGlobalColor(
    json['UUID'] as String,
    json['name'] as String,
    json['color'] == null
        ? null
        : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
    description: json['description'] as String ?? '',
  )
    ..layoutMainAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String)
    ..layoutCrossAxisSizing =
        PBDLNode.parentLayoutFromString(json['layoutCrossAxisSizing'] as String)
    ..masterPropertyReferences = json['masterPropertyReferences'] == null
        ? null
        : MasterPropertyReference.fromJson(
            json['masterPropertyReferences'] as Map<String, dynamic>)
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
    ..pbdlType = json['pbdlType'] as String
    ..colorScheme = json['colorScheme'] as String;
}

Map<String, dynamic> _$PBDLGlobalColorToJson(PBDLGlobalColor instance) {
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
  val['description'] = instance.description;
  val['pbdlType'] = instance.pbdlType;
  val['color'] = instance.color?.toJson();
  writeNotNull('colorScheme', instance.colorScheme);
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
