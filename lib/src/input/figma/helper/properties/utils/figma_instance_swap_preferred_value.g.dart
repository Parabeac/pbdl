// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_instance_swap_preferred_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstanceSwapPreferredValue _$InstanceSwapPreferredValueFromJson(
    Map<String, dynamic> json) {
  return InstanceSwapPreferredValue(
    _$enumDecodeNullable(_$InstanceSwapPreferredValueTypeEnumMap, json['type']),
    json['key'] as String,
  );
}

Map<String, dynamic> _$InstanceSwapPreferredValueToJson(
        InstanceSwapPreferredValue instance) =>
    <String, dynamic>{
      'type': _$InstanceSwapPreferredValueTypeEnumMap[instance.type],
      'key': instance.key,
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

const _$InstanceSwapPreferredValueTypeEnumMap = {
  InstanceSwapPreferredValueType.COMPONENT: 'COMPONENT',
  InstanceSwapPreferredValueType.COMPONENT_SET: 'COMPONENT_SET',
};
