import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/properties/figma_component_property.dart';
import 'package:pbdl/src/input/figma/helper/properties/utils/figma_instance_swap_preferred_value.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_definition.dart';
import 'figma_component_property_definition.dart';

part 'figma_text_property.g.dart';

@JsonSerializable()
class TextProperty implements ComponentPropertyDefinition {
  TextProperty({
    this.defaultValue,
    this.preferredValues,
    this.propertyName,
    type,
    this.value,
    this.variantOptions,
  });

  @override
  var defaultValue;

  @override
  List<InstanceSwapPreferredValue> preferredValues;

  @override
  String propertyName;

  @override
  ComponentPropertyType type = ComponentPropertyType.TEXT;

  @override
  var value;

  @override
  List<String> variantOptions;

  @override
  ComponentPropertyDefinition getType(Map<String, dynamic> json) =>
      _$TextPropertyFromJson(json);

  @override
  Map toJson() => _$TextPropertyToJson(this);

  @override
  MasterPropertyDefinition toPBDL() =>
      MasterPropertyDefinition.fromJson(toJson());
}
