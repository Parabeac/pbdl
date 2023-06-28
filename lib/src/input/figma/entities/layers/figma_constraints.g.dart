// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaConstraints _$FigmaConstraintsFromJson(Map<String, dynamic> json) =>
    FigmaConstraints(
      $enumDecodeNullable(_$FigmaConstraintTypeEnumMap, json['horizontal']),
      $enumDecodeNullable(_$FigmaConstraintTypeEnumMap, json['vertical']),
    );

Map<String, dynamic> _$FigmaConstraintsToJson(FigmaConstraints instance) =>
    <String, dynamic>{
      'horizontal': _$FigmaConstraintTypeEnumMap[instance.horizontal],
      'vertical': _$FigmaConstraintTypeEnumMap[instance.vertical],
    };

const _$FigmaConstraintTypeEnumMap = {
  FigmaConstraintType.CENTER: 'CENTER',
  FigmaConstraintType.TOP_BOTTOM: 'TOP_BOTTOM',
  FigmaConstraintType.LEFT_RIGHT: 'LEFT_RIGHT',
  FigmaConstraintType.SCALE: 'SCALE',
  FigmaConstraintType.TOP: 'TOP',
  FigmaConstraintType.BOTTOM: 'BOTTOM',
  FigmaConstraintType.RIGHT: 'RIGHT',
  FigmaConstraintType.LEFT: 'LEFT',
};
