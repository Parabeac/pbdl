// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figma_auto_layout_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FigmaAutoLayoutOptions _$FigmaAutoLayoutOptionsFromJson(
        Map<String, dynamic> json) =>
    FigmaAutoLayoutOptions(
      layoutMode: json['layoutMode'] as String?,
      itemSpacing: json['itemSpacing'] as num?,
      paddingLeft: json['paddingLeft'] as num?,
      paddingRight: json['paddingRight'] as num?,
      paddingTop: json['paddingTop'] as num?,
      paddingBottom: json['paddingBottom'] as num?,
      primaryAxisSizingMode: json['primaryAxisSizingMode'] as String?,
      counterAxisSizingMode: json['counterAxisSizingMode'] as String?,
      primaryAxisAlignItems: json['primaryAxisAlignItems'] as String?,
      counterAxisAlignItems: json['counterAxisAlignItems'] as String?,
    );

Map<String, dynamic> _$FigmaAutoLayoutOptionsToJson(
        FigmaAutoLayoutOptions instance) =>
    <String, dynamic>{
      'layoutMode': instance.layoutMode,
      'itemSpacing': instance.itemSpacing,
      'paddingLeft': instance.paddingLeft,
      'paddingRight': instance.paddingRight,
      'paddingTop': instance.paddingTop,
      'paddingBottom': instance.paddingBottom,
      'primaryAxisSizingMode': instance.primaryAxisSizingMode,
      'counterAxisSizingMode': instance.counterAxisSizingMode,
      'primaryAxisAlignItems': instance.primaryAxisAlignItems,
      'counterAxisAlignItems': instance.counterAxisAlignItems,
    };
