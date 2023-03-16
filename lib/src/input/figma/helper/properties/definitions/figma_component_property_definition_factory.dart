import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_boolean_property.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_component_property_definition.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_instance_swap_property.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_text_property.dart';
import 'package:pbdl/src/input/figma/helper/properties/figma_component_property.dart';

class ComponentPropertyDefinitionFactory {
  static final _propertyTypes = <ComponentPropertyDefinition>[
    BooleanProperty(),
    TextProperty(),
    InstanceSwapProperty(),
  ];

  /// Returns a [ComponentPropertyDefinition] from a [Map].
  /// [name] is passed since Figma does not include it inside the [Map]
  static ComponentPropertyDefinition getType(Map<String, dynamic> property) {
    for (var propertyType in _propertyTypes) {
      if (propertyType.type ==
          ComponentProperty.stringToComponentPropertyType(property['type'])) {
        return propertyType.getType(property);
      }
    }
    return null;
  }
}
