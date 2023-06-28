import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_image.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_style.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_symbol_id.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_text_style.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_text_value.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';

class FigmaOverrideTypeFactory {
  static final _overrideTypes = <FigmaOverrideType>[
    FigmaOverrideTextValue(),
    FigmaOverrideImage(),
    FigmaOverrideStyle(),
    FigmaOverrideSymbolID(),
    FigmaOverrideTextStyle(),
  ];

  /// Returns an [OverrideType] from a [FigmaNode] or `null` if node is not overridable.
  static FigmaOverrideType? getType(FigmaNode? node) {
    for (var ovrType in _overrideTypes) {
      if (ovrType.matches(node)) {
        return ovrType;
      }
    }
    return null;
  }
}
