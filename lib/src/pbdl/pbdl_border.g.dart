// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_border.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBorder _$PBDLBorderFromJson(Map<String, dynamic> json) {
  return PBDLBorder(
    isEnabled: json['isEnabled'] as bool,
    fillType: (json['fillType'] as num)?.toDouble(),
    color: json['color'] == null
        ? null
        : PBDLColor.fromJson(json['color'] as Map<String, dynamic>),
    thickness: (json['thickness'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PBDLBorderToJson(PBDLBorder instance) =>
    <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'fillType': instance.fillType,
      'color': instance.color?.toJson(),
      'thickness': instance.thickness,
    };
