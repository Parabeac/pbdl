import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_symbol_id.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/layers/symbol_instance.dart';

import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideSymbolID extends SketchOverrideType {
  @override
  final String TYPE_NAME = 'symbolID';

  @override
  Future<PBDLSharedInstanceNode> getValue(SketchNode node) async {
    if (node is! SymbolInstance) {
      return null;
    }
    return await (node as SymbolInstance).interpretNode();
  }

  @override
  String getPBDLType() => PBDLOverrideSymbolID.PBDL_TYPE_NAME;
}
