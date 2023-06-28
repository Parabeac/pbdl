// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLProject _$PBDLProjectFromJson(Map<String, dynamic> json) => PBDLProject(
      name: json['name'] as String?,
      UUID: json['UUID'] as String? ?? '',
      pages: (json['pages'] as List<dynamic>?)
          ?.map((e) => PBDLPage.fromJson(e as Map<String, dynamic>))
          .toList(),
      pngPath: json['pngPath'] as String?,
      globalStyles: json['globalStyles'] == null
          ? null
          : PBDLGlobalStyles.fromJson(
              json['globalStyles'] as Map<String, dynamic>),
      designSystem: json['designSystem'] == null
          ? null
          : DesignSystemThemeData.fromJson(
              json['designSystem'] as Map<String, dynamic>),
    )
      ..layoutMainAxisSizing = PBDLNode.parentLayoutFromString(
          json['layoutMainAxisSizing'] as String?)
      ..layoutCrossAxisSizing = PBDLNode.parentLayoutFromString(
          json['layoutCrossAxisSizing'] as String?)
      ..isVisible = json['isVisible'] as bool?
      ..boundaryRectangle = json['boundaryRectangle'] == null
          ? null
          : PBDLBoundaryBox.fromJson(
              json['boundaryRectangle'] as Map<String, dynamic>)
      ..style = json['style'] == null
          ? null
          : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
      ..prototypeNodeUUID = json['prototypeNodeUUID'] as String?
      ..child = json['child'] == null
          ? null
          : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
      ..constraints = json['constraints'] == null
          ? null
          : PBDLConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>)
      ..miscPages = (json['miscPages'] as List<dynamic>?)
          ?.map((e) => PBDLPage.fromJson(e as Map<String, dynamic>))
          .toList()
      ..pbdlType = json['pbdlType'] as String?;

Map<String, dynamic> _$PBDLProjectToJson(PBDLProject instance) =>
    <String, dynamic>{
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
      'child': instance.child?.toJson(),
      'constraints': instance.constraints?.toJson(),
      'pngPath': instance.pngPath,
      'designSystem': instance.designSystem?.toJson(),
      'pages': instance.pages?.map((e) => e.toJson()).toList(),
      'miscPages': instance.miscPages?.map((e) => e.toJson()).toList(),
      'globalStyles': instance.globalStyles?.toJson(),
      'pbdlType': instance.pbdlType,
    };

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
