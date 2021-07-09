// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLProject _$PBDLProjectFromJson(Map<String, dynamic> json) {
  return PBDLProject(
    projectName: json['projectName'] as String,
    id: json['id'] as String,
  )
    ..debug = json['debug'] as bool
    ..pbdfType = json['pbdfType'] as String
    ..pages = (json['pages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..miscPages = (json['miscPages'] as List)
        ?.map((e) =>
            e == null ? null : PBDLPage.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..sharedStyles = (json['sharedStyles'] as List)
        ?.map((e) =>
            e == null ? null : SharedStyle.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PBDLProjectToJson(PBDLProject instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'debug': instance.debug,
      'id': instance.id,
      'pbdfType': instance.pbdfType,
      'pages': instance.pages,
      'miscPages': instance.miscPages,
      'sharedStyles': instance.sharedStyles,
    };
