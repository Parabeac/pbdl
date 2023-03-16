// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_component_property_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentPropertyReference _$ComponentPropertyReferenceFromJson(
    Map<String, dynamic> json) {
  return ComponentPropertyReference(
    json['visible'] as String,
    json['characters'] as String,
    json['mainComponent'] as String,
  );
}

Map<String, dynamic> _$ComponentPropertyReferenceToJson(
        ComponentPropertyReference instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'characters': instance.characters,
      'mainComponent': instance.mainComponent,
    };
