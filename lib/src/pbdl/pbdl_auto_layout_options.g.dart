// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_auto_layout_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLAutoLayoutOptions _$PBDLAutoLayoutOptionsFromJson(
        Map<String, dynamic> json) =>
    PBDLAutoLayoutOptions(
      orientation:
          $enumDecodeNullable(_$OrientationEnumMap, json['orientation']),
      spacing: json['spacing'] as num?,
      leftPadding: json['leftPadding'] as num?,
      rightPadding: json['rightPadding'] as num?,
      topPadding: json['topPadding'] as num?,
      bottomPadding: json['bottomPadding'] as num?,
      counterAxisAlignment: $enumDecodeNullable(
          _$AxisAlignmentEnumMap, json['counterAxisAlignment']),
      primaryAxisAlignment: $enumDecodeNullable(
          _$AxisAlignmentEnumMap, json['primaryAxisAlignment']),
      counterAxisSizing:
          $enumDecodeNullable(_$AxisModeEnumMap, json['counterAxisSizing']),
      primaryAxisSizing:
          $enumDecodeNullable(_$AxisModeEnumMap, json['primaryAxisSizing']),
    );

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
