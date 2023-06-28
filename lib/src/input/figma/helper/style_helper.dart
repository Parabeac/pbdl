import 'package:pbdl/src/input/figma/entities/style/fill/gradient_fill_type.dart';
import 'package:pbdl/src/input/figma/entities/style/style_addition.dart';

class StyleHelper {
  /// Function that returns `true` if a particular FigmaNode should be exported as an image
  /// based on the [nodes] provided. Returns `false` otherwise.
  static bool isImage(List<StyleAdditionNode>? nodes) {
    if (nodes == null || nodes.isEmpty) {
      return false;
    }
    var seen = <StyleAdditionNode>[];
    for (var style in nodes) {
      if (style.type == 'IMAGE' ||
          (style is GradientFillType &&
              !style.type!.toLowerCase().contains('linear'))) {
        return true;
      } else if (seen.any((element) => element.addStyle(style) == 'IMAGE')) {
        return true;
      }
      seen.add(style);
    }
    return false;
  }
}
