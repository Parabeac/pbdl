// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_master_property_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterPropertyDefinition _$MasterPropertyDefinitionFromJson(
    Map<String, dynamic> json) {
  return MasterPropertyDefinition(
    _$enumDecodeNullable(_$MasterPropertyTypeEnumMap, json['type']),
    json['value'],
    json['preferredValues'],
    json['propertyName'] as String,
    json['defaultValue'],
    (json['variantOptions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MasterPropertyDefinitionToJson(
    MasterPropertyDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$MasterPropertyTypeEnumMap[instance.type]);
  writeNotNull('value', instance.value);
  writeNotNull('preferredValues', instance.preferredValues);
  writeNotNull('propertyName', instance.propertyName);
  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('variantOptions', instance.variantOptions);
  return val;
}

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

const _$MasterPropertyTypeEnumMap = {
  MasterPropertyType.BOOLEAN: 'BOOLEAN',
  MasterPropertyType.TEXT: 'TEXT',
  MasterPropertyType.INSTANCE_SWAP: 'INSTANCE_SWAP',
  MasterPropertyType.VARIANT: 'VARIANT',
};

SharedInstanceSwapPreferredValue _$SharedInstanceSwapPreferredValueFromJson(
    Map<String, dynamic> json) {
  return SharedInstanceSwapPreferredValue(
    _$enumDecodeNullable(_$InstanceSwapPreferredValueTypeEnumMap, json['type']),
    json['key'] as String,
  );
}

Map<String, dynamic> _$SharedInstanceSwapPreferredValueToJson(
        SharedInstanceSwapPreferredValue instance) =>
    <String, dynamic>{
      'type': _$InstanceSwapPreferredValueTypeEnumMap[instance.type],
      'key': instance.key,
    };

const _$InstanceSwapPreferredValueTypeEnumMap = {
  InstanceSwapPreferredValueType.COMPONENT: 'COMPONENT',
  InstanceSwapPreferredValueType.COMPONENT_SET: 'COMPONENT_SET',
};
