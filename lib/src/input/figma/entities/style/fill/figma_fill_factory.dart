import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/fill/gradient_fill_type.dart';

import 'fill_type.dart';

class FigmaFillFactory {
  static final _fills = <FigmaFill>[
    SolidFillType(),
    GradientFillType(),
    ImageFillType(),
  ];
  static FigmaFill? getFill(Map<String, dynamic>? json) {
    for (var fill in _fills) {
      if (fill.type == json!['type']) {
        return fill.createFigmaFill(json);
      } else if (json['type'].toLowerCase().contains('gradient')) {
        return GradientFillType.fromJson(json);
      }
    }
    return null;
  }
}
