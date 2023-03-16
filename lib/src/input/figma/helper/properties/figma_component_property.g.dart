// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_component_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentProperty _$ComponentPropertyFromJson(Map<String, dynamic> json) {
  return ComponentProperty(
    _$enumDecodeNullable(_$ComponentPropertyTypeEnumMap, json['type']),
    json['value'],
    (json['preferredValues'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSwapPreferredValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ComponentPropertyToJson(ComponentProperty instance) =>
    <String, dynamic>{
      'type': _$ComponentPropertyTypeEnumMap[instance.type],
      'value': instance.value,
      'preferredValues': instance.preferredValues,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ComponentPropertyTypeEnumMap = {
  ComponentPropertyType.BOOLEAN: 'BOOLEAN',
  ComponentPropertyType.TEXT: 'TEXT',
  ComponentPropertyType.INSTANCE_SWAP: 'INSTANCE_SWAP',
  ComponentPropertyType.VARIANT: 'VARIANT',
};
