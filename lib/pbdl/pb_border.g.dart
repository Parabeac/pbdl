// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_border.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBBorder _$PBBorderFromJson(Map<String, dynamic> json) {
  return PBBorder(
    isEnabled: json['isEnabled'] as bool,
    fillType: (json['fillType'] as num)?.toDouble(),
    color: json['color'] == null
        ? null
        : PBColor.fromJson(json['color'] as Map<String, dynamic>),
    thickness: (json['thickness'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PBBorderToJson(PBBorder instance) => <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'fillType': instance.fillType,
      'color': instance.color,
      'thickness': instance.thickness,
    };
