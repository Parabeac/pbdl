import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/global/fill_style_global.dart';
import 'package:pbdl/src/input/figma/entities/style/global/text_style_global.dart';

abstract class GlobalStyleProperty extends FigmaBaseNode {
  final String UUID;
  String name;
  final String description;
  final String styleType;
  FigmaBaseNode styleNode;

  GlobalStyleProperty(
    this.UUID,
    this.styleType, {
    this.name = '',
    this.description = '',
    this.styleNode,
  });

  /// Converts [json] into a [GlobalStyleProperty]. Needs [styleNode]
  /// in order for each subclass to extract styling information from it.
  factory GlobalStyleProperty.fromJson(
      Map<String, dynamic> json, FigmaBaseNode styleNode) {
    switch (json['styleType']) {
      case 'FILL':
        return FillStyleGlobal.fromJson(json, styleNode);
      case 'TEXT':
        return TextStyleGlobal.fromJson(json, styleNode);
      default:
        return null;
    }
  }
}
