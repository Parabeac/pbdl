// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFill _$PBDLFillFromJson(Map<String, dynamic> json) {
  return PBDLFill(
    json['color'] == null
        ? null
        : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
    json['isEnabled'] as bool,
  );
}

Map<String, dynamic> _$PBDLFillToJson(PBDLFill instance) => <String, dynamic>{
      'color': instance.color?.toJson(),
      'isEnabled': instance.isEnabled,
    };
