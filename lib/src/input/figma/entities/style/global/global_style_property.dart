import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/global/fill_style_global.dart';

abstract class GlobalStyleProperty extends FigmaBaseNode {
  final String UUID;
  final String name;
  final String description;
  final String styleType;

  GlobalStyleProperty(this.UUID, this.styleType,
      {this.name = '', this.description = ''});

  factory GlobalStyleProperty.fromJson(Map<String, dynamic> json) {
    switch (json['styleType']) {
      case 'FILL':
        return FillStyleGlobal.fromJson(json);
      default:
        return null;
    }
  }
}
