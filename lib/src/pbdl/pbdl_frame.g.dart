// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFrame _$PBDLFrameFromJson(Map<String, dynamic> json) {
  return PBDLFrame(
    UUID: json['UUID'] as String,
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'] as String,
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prototypeNodeUUID: json['prototypeNodeUUID'] as String,
    fixedRadius: json['fixedRadius'] as num,
    background: json['background'] as Map<String, dynamic>,
    autoLayoutOptions: json['autoLayoutOptions'] == null
        ? null
        : PBDLAutoLayoutOptions.fromJson(
            json['autoLayoutOptions'] as Map<String, dynamic>),
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
  )..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLFrameToJson(PBDLFrame instance) => <String, dynamic>{
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
      'constraints': instance.constraints?.toJson(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'pbdlType': instance.pbdlType,
      'fixedRadius': instance.fixedRadius,
      'background': instance.background,
      'autoLayoutOptions': instance.autoLayoutOptions?.toJson(),
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};

PBDLRow _$PBDLRowFromJson(Map<String, dynamic> json) {
  return PBDLRow()
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
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..fixedRadius = json['fixedRadius'] as num
    ..background = json['background'] as Map<String, dynamic>
    ..autoLayoutOptions = json['autoLayoutOptions'] == null
        ? null
        : PBDLAutoLayoutOptions.fromJson(
            json['autoLayoutOptions'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLRowToJson(PBDLRow instance) => <String, dynamic>{
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
      'constraints': instance.constraints?.toJson(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'fixedRadius': instance.fixedRadius,
      'background': instance.background,
      'autoLayoutOptions': instance.autoLayoutOptions?.toJson(),
      'pbdlType': instance.pbdlType,
    };

PBDLCol _$PBDLColFromJson(Map<String, dynamic> json) {
  return PBDLCol()
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
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : PBDLNode.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..fixedRadius = json['fixedRadius'] as num
    ..background = json['background'] as Map<String, dynamic>
    ..autoLayoutOptions = json['autoLayoutOptions'] == null
        ? null
        : PBDLAutoLayoutOptions.fromJson(
            json['autoLayoutOptions'] as Map<String, dynamic>)
    ..pbdlType = json['pbdlType'] as String;
}

Map<String, dynamic> _$PBDLColToJson(PBDLCol instance) => <String, dynamic>{
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
      'constraints': instance.constraints?.toJson(),
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'fixedRadius': instance.fixedRadius,
      'background': instance.background,
      'autoLayoutOptions': instance.autoLayoutOptions?.toJson(),
      'pbdlType': instance.pbdlType,
    };
