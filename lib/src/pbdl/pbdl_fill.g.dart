// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFill _$PBDLFillFromJson(Map<String, dynamic> json) {
  return PBDLFill(
    opacity: json['opacity'] as num ?? 100,
    blendMode: json['blendMode'] as String,
    type: json['type'] as String,
    isEnabled: json['isEnabled'] as bool ?? true,
    color: json['color'] == null
        ? null
        : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
    imageRef: json['imageRef'] as String,
  );
}

Map<String, dynamic> _$PBDLFillToJson(PBDLFill instance) => <String, dynamic>{
      'imageRef': instance.imageRef,
      'color': instance.color?.toJson(),
      'opacity': instance.opacity,
      'blendMode': instance.blendMode,
      'type': instance.type,
      'isEnabled': instance.isEnabled,
    };
