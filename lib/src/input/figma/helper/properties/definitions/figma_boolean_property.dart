import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_component_property_definition_factory.dart';
import 'package:pbdl/src/input/figma/helper/properties/figma_component_property.dart';
import 'package:pbdl/src/input/figma/helper/properties/utils/figma_instance_swap_preferred_value.dart';
import 'figma_component_property_definition.dart';

part 'figma_boolean_property.g.dart';

@JsonSerializable()
class BooleanProperty
    implements ComponentPropertyDefinition, ComponentPropertyDefinitionFactory {
  BooleanProperty({
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
  ComponentPropertyType type = ComponentPropertyType.BOOLEAN;

  @override
  var value;

  @override
  List<String> variantOptions;

  @override
  ComponentPropertyDefinition getType(Map<String, dynamic> json) =>
      _$BooleanPropertyFromJson(json);

  @override
  Map toJson() => _$BooleanPropertyToJson(this);
}
