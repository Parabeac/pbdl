import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/pbdl/pbdl_override_property.dart';

abstract class FigmaOverrideType {
  /// Method that takes in a [FigmaNode] and returns the override value.
  ///
  /// For instance, if we have a `stringValue`, we may need to look at the `attributedString` attribute of `node`.
  Future<PBDLOverrideProperty> getValue(FigmaNode node);

  /// Get the type of this override in PBDL
  String getPBDLType();

  /// Returns [true] if `node` has an attribute for this [FigmaOverrideType]
  bool matches(FigmaNode node);
}