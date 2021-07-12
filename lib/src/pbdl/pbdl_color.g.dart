// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLColor _$PBDLColorFromJson(Map<String, dynamic> json) {
  return PBDLColor(
    (json['alpha'] as num)?.toDouble(),
    (json['red'] as num)?.toDouble(),
    (json['green'] as num)?.toDouble(),
    (json['blue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PBDLColorToJson(PBDLColor instance) => <String, dynamic>{
      'alpha': instance.alpha,
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
    };
