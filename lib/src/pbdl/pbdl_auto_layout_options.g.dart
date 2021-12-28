// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_auto_layout_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLAutoLayoutOptions _$PBDLAutoLayoutOptionsFromJson(
    Map<String, dynamic> json) {
  return PBDLAutoLayoutOptions(
    orientation:
        _$enumDecodeNullable(_$OrientationEnumMap, json['orientation']),
    spacing: json['spacing'] as num,
    leftPadding: json['leftPadding'] as num,
    rightPadding: json['rightPadding'] as num,
    topPadding: json['topPadding'] as num,
    bottomPadding: json['bottomPadding'] as num,
    counterAxisAlignment: _$enumDecodeNullable(
        _$AxisAlignmentEnumMap, json['counterAxisAlignment']),
    primaryAxisAlignment: _$enumDecodeNullable(
        _$AxisAlignmentEnumMap, json['primaryAxisAlignment']),
    counterAxisSizing:
        _$enumDecodeNullable(_$AxisModeEnumMap, json['counterAxisSizing']),
    primaryAxisSizing:
        _$enumDecodeNullable(_$AxisModeEnumMap, json['primaryAxisSizing']),
  );
}

Map<String, dynamic> _$PBDLAutoLayoutOptionsToJson(
        PBDLAutoLayoutOptions instance) =>
    <String, dynamic>{
      'orientation': _$OrientationEnumMap[instance.orientation],
      'spacing': instance.spacing,
      'leftPadding': instance.leftPadding,
      'rightPadding': instance.rightPadding,
      'topPadding': instance.topPadding,
      'bottomPadding': instance.bottomPadding,
      'counterAxisAlignment':
          _$AxisAlignmentEnumMap[instance.counterAxisAlignment],
      'primaryAxisAlignment':
          _$AxisAlignmentEnumMap[instance.primaryAxisAlignment],
      'counterAxisSizing': _$AxisModeEnumMap[instance.counterAxisSizing],
      'primaryAxisSizing': _$AxisModeEnumMap[instance.primaryAxisSizing],
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

const _$OrientationEnumMap = {
  Orientation.VERTICAL: 'VERTICAL',
  Orientation.HORIZONTAL: 'HORIZONTAL',
};

const _$AxisAlignmentEnumMap = {
  AxisAlignment.START: 'START',
  AxisAlignment.CENTER: 'CENTER',
  AxisAlignment.END: 'END',
  AxisAlignment.SPACE_BETWEEN: 'SPACE_BETWEEN',
};

const _$AxisModeEnumMap = {
  AxisMode.FIXED: 'FIXED',
  AxisMode.HUGGED: 'HUGGED',
};
