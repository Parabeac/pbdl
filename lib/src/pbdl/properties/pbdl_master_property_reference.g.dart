// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_master_property_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterPropertyReference _$MasterPropertyReferenceFromJson(
    Map<String, dynamic> json) {
  return MasterPropertyReference(
    json['visible'] as String,
    json['characters'] as String,
    json['mainComponent'] as String,
  );
}

Map<String, dynamic> _$MasterPropertyReferenceToJson(
    MasterPropertyReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('visible', instance.visible);
  writeNotNull('characters', instance.characters);
  writeNotNull('mainComponent', instance.mainComponent);
  return val;
}
