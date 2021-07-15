// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLProject _$PBDLProjectFromJson(Map<String, dynamic> json) {
  return PBDLProject(
    projectName: json['projectName'] as String,
    id: json['id'] as String,
    pngPath: json['pngPath'] as String,
    pages: (json['pages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..debug = json['debug'] as bool
    ..pbdfType = json['pbdfType'] as String
    ..miscPages = (json['miscPages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..sharedStyles = (json['sharedStyles'] as List)
        ?.map((e) =>
            e == null ? null : SharedStyle.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..UUID = json['UUID'] as String
    ..boundaryRectangle = json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>)
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..isVisible = json['isVisible'] as bool
    ..name = json['name'] as String
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..style = json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>)
    ..type = json['type'] as String;
}

Map<String, dynamic> _$PBDLProjectToJson(PBDLProject instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'debug': instance.debug,
      'id': instance.id,
      'pbdfType': instance.pbdfType,
      'pngPath': instance.pngPath,
      'pages': instance.pages,
      'miscPages': instance.miscPages,
      'sharedStyles': instance.sharedStyles,
      'UUID': instance.UUID,
      'boundaryRectangle': instance.boundaryRectangle,
      'child': instance.child,
      'isVisible': instance.isVisible,
      'name': instance.name,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'style': instance.style,
      'type': instance.type,
    };
