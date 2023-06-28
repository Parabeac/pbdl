import 'package:pbdl/src/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';

import '../../../../../pbdl.dart';
import 'figma_node.dart';

part 'component_set.g.dart';

@JsonSerializable()
class FigmaComponentSet extends FigmaNode implements FigmaNodeFactory {
  @override
  String? type = 'COMPONENT_SET';

  List<FigmaNode>? children;

  FigmaComponentSet(
      {String? name, bool? isVisible, String? type, pluginData, sharedPluginData})
      : super(name, isVisible, type, pluginData, sharedPluginData);

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    for (var i = 0; i < json['children'].length; i++) {
      json['children'][i]['componentSetId'] = json['id'];
      json['children'][i]['componentSetName'] =
          json['name'].replaceAll('<custom>', '');
      json['children'][i]['name'] =
          formatName(json['name'], json['children'][i]['name']);
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
  Future<PBDLNode?> interpretNode() async {
    return null;
  }
}
