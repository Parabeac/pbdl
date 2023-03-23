// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_master_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterProperty _$MasterPropertyFromJson(Map<String, dynamic> json) {
  return MasterProperty(
    _$enumDecodeNullable(_$MasterPropertyTypeEnumMap, json['type']),
    json['value'],
    (json['preferredValues'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSwapPreferredValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MasterPropertyToJson(MasterProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$MasterPropertyTypeEnumMap[instance.type]);
  writeNotNull('value', instance.value);
  writeNotNull('preferredValues', instance.preferredValues);
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
