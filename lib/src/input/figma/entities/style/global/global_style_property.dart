import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/global/fill_style_global.dart';
import 'package:pbdl/src/input/figma/entities/style/global/text_style_global.dart';

abstract class GlobalStyleProperty extends FigmaBaseNode {
  final String UUID;
  final String name;
  final String description;
  final String styleType;

  GlobalStyleProperty(this.UUID, this.styleType,
      {this.name = '', this.description = ''});

  /// Function that populates [this] with the necessary information from [json].
  void populate(Map<String, dynamic> json);

  factory GlobalStyleProperty.fromJson(Map<String, dynamic> json) {
    switch (json['styleType']) {
      case 'FILL':
        return FillStyleGlobal.fromJson(json);
      case 'TEXT':
        return TextStyleGlobal.fromJson(json);
      default:
        return null;
    }
  }
}
