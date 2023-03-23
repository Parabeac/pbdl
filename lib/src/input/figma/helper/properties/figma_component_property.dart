import 'package:pbdl/src/input/figma/helper/properties/utils/figma_instance_swap_preferred_value.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property.dart';

part 'figma_component_property.g.dart';

@JsonSerializable()
class ComponentProperty {
  ComponentProperty(
    this.type,
    this.value,
    this.preferredValues,
  );

  ComponentPropertyType type;

  // Either String or Bool
  var value;

  List<InstanceSwapPreferredValue> preferredValues;

  static ComponentPropertyType stringToComponentPropertyType(String value) =>
      _$enumDecodeNullable(_$ComponentPropertyTypeEnumMap, value);

  factory ComponentProperty.fromJson(Map<String, dynamic> json) =>
      _$ComponentPropertyFromJson(json);

  Map toJson() => _$ComponentPropertyToJson(this);

  MasterProperty toPBDL() => MasterProperty.fromJson(toJson());
}

enum ComponentPropertyType {
  BOOLEAN,
  TEXT,
  INSTANCE_SWAP,
  VARIANT,
}
