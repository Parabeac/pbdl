// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pb_fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBFill _$PBFillFromJson(Map<String, dynamic> json) {
  return PBFill(
    json['color'] == null
        ? null
        : PBColor.fromJson(json['color'] as Map<String, dynamic>),
    json['isEnabled'] as bool,
  );
}

Map<String, dynamic> _$PBFillToJson(PBFill instance) => <String, dynamic>{
      'color': instance.color,
      'isEnabled': instance.isEnabled,
    };
