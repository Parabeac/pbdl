import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';

abstract class SketchOverrideType {
  /// [String] that indicates what sketch labels this [SketchOverrideType] as.
  String TYPE_NAME;

  /// Method that takes in a [SketchNode] and returns the override value.
  ///
  /// For instance, if we have a `stringValue`, we may need to look at the `attributedString` attribute of `node`.
  Future<PBDLNode> getValue(SketchNode node);

  String getPBDLType();
}
