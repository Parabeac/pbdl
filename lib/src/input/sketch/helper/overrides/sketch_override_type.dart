import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/objects/override_value.dart';

abstract class SketchOverrideType {
  /// [String] that indicates what sketch labels this [SketchOverrideType] as.
  String TYPE_NAME;

  /// Method that takes in a [SketchNode] and returns the override property.
  ///
  /// For instance, if we have a `stringValue` override property, we will return a [PBDLText]
  Future<PBDLNode> getProperty(SketchNode node);

  /// Method that returns a string representation of an [OverrideValue]
  String getValue(OverridableValue overrideValue);

  String getPBDLType();
}
