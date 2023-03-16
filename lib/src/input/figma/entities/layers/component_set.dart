import 'package:pbdl/src/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/input/figma/helper/properties/definitions/figma_component_property_definition.dart';
import 'package:pbdl/src/input/figma/helper/properties/references/figma_component_property_reference.dart';

import '../../../../../pbdl.dart';
import 'figma_node.dart';

part 'component_set.g.dart';

@JsonSerializable()
class FigmaComponentSet extends FigmaNode implements FigmaNodeFactory {
  @override
  String type = 'COMPONENT_SET';

  List<FigmaNode> children;

  Map<String, ComponentPropertyDefinition> componentPropertyDefinitions;

  FigmaComponentSet({
    String name,
    bool isVisible,
    String type,
    pluginData,
    sharedPluginData,
    componentPropertyDefinitions,
  }) : super(name, isVisible, type, pluginData, sharedPluginData);

  /// This method splits the [COMPONENT_SET] into [COMPONENTS]
  /// Therefore, it needs to pass certain information down to its children
  /// TODO: We can improve this by handling the [COMPONENT_SET]
  /// as its own thing
  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    for (var i = 0; i < json['children'].length; i++) {
      json['children'][i]['componentSetId'] = json['id'];
      json['children'][i]['componentSetName'] =
          json['name'].replaceAll('<custom>', '');
      json['children'][i]['name'] =
          formatName(json['name'], json['children'][i]['name']);
      json['children'][i]['componentPropertyDefinitions'] =
          json['componentPropertyDefinitions'];
    }
    return _$FigmaComponentSetFromJson(json);
  }

  String formatName(String setName, String componentName) {
    var formattedName = '';

    var formatedComponentName = componentName
        .replaceAll('=', '_')
        .replaceAll(',', '_')
        .replaceAll(' ', '')
        .toLowerCase();

    formattedName += formatedComponentName;

    if (setName.contains('<custom>')) {
      formattedName += ' <custom>';
    }

    return formattedName;
  }

  @override
  Future<PBDLNode> interpretNode() async {
    return null;
  }
}
