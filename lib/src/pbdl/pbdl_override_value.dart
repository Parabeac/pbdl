import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

class PBDLOverrideValue extends PBDLNode implements PBDLNodeFactory {
  ///List of [PBDLNode] that indicates what `values` this [PBDLOverrideValue] overrode
  List<PBDLNode> values;

  PBDLOverrideValue(
    String UUID,
    String name,
    bool isVisible,
    boundaryRectangle,
    String type,
    PBDLStyle style,
    String prototypeNodeUUID,
    this.values,
  ) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          type,
          style,
          prototypeNodeUUID,
        ) {
    values ??= [];
  }
}
