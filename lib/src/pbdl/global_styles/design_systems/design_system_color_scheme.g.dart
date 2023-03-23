// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_system_color_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DesignSystemColorSchemeToJson(
    DesignSystemColorScheme instance) {
  final val = <String, dynamic>{
    'UUID': instance.UUID,
    'layoutMainAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
    'layoutCrossAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('masterPropertyReferences', instance.masterPropertyReferences);
  val['name'] = instance.name;
  val['isVisible'] = instance.isVisible;
  val['boundaryRectangle'] = instance.boundaryRectangle;
  val['pbdlType'] = instance.pbdlType;
  val['style'] = instance.style;
  val['prototypeNodeUUID'] = instance.prototypeNodeUUID;
  val['child'] = instance.child;
  val['constraints'] = instance.constraints;
  val['supportedAttributes'] = instance.supportedAttributes?.toList();
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
