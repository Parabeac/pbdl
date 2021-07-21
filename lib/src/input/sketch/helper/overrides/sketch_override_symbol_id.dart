import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_symbol_id.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/layers/symbol_master.dart';
import 'package:pbdl/src/input/sketch/helper/overrides/sketch_override_type.dart';

class SketchOverrideSymbolID extends SketchOverrideType {
  @override
  final String TYPE_NAME = 'symbolID';

  @override
  Future<String> getValue(SketchNode node) {
    if (node is! SymbolMaster) {
      return Future.value('');
    }
    return Future.value((node as SymbolMaster).symbolID);
  }

  @override
  String getPBDLType() => PBDLOverrideSymbolID.PBDL_TYPE_NAME;
}
