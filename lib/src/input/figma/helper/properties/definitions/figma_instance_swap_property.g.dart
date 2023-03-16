// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_instance_swap_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstanceSwapProperty _$InstanceSwapPropertyFromJson(Map<String, dynamic> json) {
  return InstanceSwapProperty(
    defaultValue: json['defaultValue'],
    preferredValues: (json['preferredValues'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSwapPreferredValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    propertyName: json['propertyName'] as String,
    type: json['type'],
    value: json['value'],
    variantOptions:
        (json['variantOptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$InstanceSwapPropertyToJson(
        InstanceSwapProperty instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'preferredValues': instance.preferredValues,
      'propertyName': instance.propertyName,
      'type': _$ComponentPropertyTypeEnumMap[instance.type],
      'value': instance.value,
      'variantOptions': instance.variantOptions,
    };

const _$ComponentPropertyTypeEnumMap = {
  ComponentPropertyType.BOOLEAN: 'BOOLEAN',
  ComponentPropertyType.TEXT: 'TEXT',
  ComponentPropertyType.INSTANCE_SWAP: 'INSTANCE_SWAP',
  ComponentPropertyType.VARIANT: 'VARIANT',
};
