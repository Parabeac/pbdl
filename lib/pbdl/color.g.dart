// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBColor _$PBColorFromJson(Map<String, dynamic> json) {
  return PBColor(
    (json['alpha'] as num)?.toDouble(),
    (json['red'] as num)?.toDouble(),
    (json['green'] as num)?.toDouble(),
    (json['blue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PBColorToJson(PBColor instance) => <String, dynamic>{
      'alpha': instance.alpha,
      'red': instance.red,
      'green': instance.green,
      'blue': instance.blue,
    };
