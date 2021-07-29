import 'package:pbdl/src/input/figma/helper/symbol_node_mixin.dart';
import 'package:pbdl/src/input/sketch/entities/objects/sketch_override.dart';
import 'package:pbdl/src/input/sketch/entities/objects/override_value.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_image.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_style.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_symbol_id.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_text_style.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_text_value.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideTypeFactory {
  static final _overrideTypes = <SketchOverrideType>[
    SketchOverrideImage(),
    SketchOverrideStyle(),
    SketchOverrideSymbolID(),
    SketchOverrideTextStyle(),
    SketchOverrideTextValue(),
  ];

  /// Returns an [OverrideType] from an [OverridableValue].
  static SketchOverrideType getType(SketchOverride node) {
    var uuidTypeMap = SymbolNodeMixin.extractParameter(node.overrideName);
    var type = uuidTypeMap['type'];
    for (var ovrType in _overrideTypes) {
      if (ovrType.TYPE_NAME == type) {
        return ovrType;
      }
    }
    return null;
  }
}
