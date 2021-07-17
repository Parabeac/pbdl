import 'package:pbdl/src/input/figma/entities/layers/figma_frame.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/instance.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_symbol_id.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';

class FigmaOverrideSymbolID extends FigmaOverrideType {
  @override
  Future<PBDLOverrideProperty> getValue(FigmaNode node) {
    if (node is! Instance) {
      return Future.value(null);
    }
    return Future.value(PBDLOverrideProperty(
      node.UUID,
      node.name,
      node.isVisible,
      ((node as Instance).boundaryRectangle as FigmaFrame).interpretNode(),
      getPBDLType(),
      ((node as Instance).style as FigmaStyle).interpretStyle(),
      null,
      (node as Instance).symbolID,
    ));
  }

  @override
  String getPBDLType() => PBDLOverrideSymbolID.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is Instance;
}
