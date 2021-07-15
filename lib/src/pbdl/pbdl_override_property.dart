import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

class PBDLOverrideProperty extends PBDLNode implements PBDLNodeFactory {
  /// List of [PBDLNode] that indicates what properties of this [PBDLOverrideProperty] are overridable
  List<PBDLNode> properties;

  /// Value of the override property
  var value;

  PBDLOverrideProperty(
    String UUID,
    String name,
    bool isVisible,
    boundaryRectangle,
    String type,
    PBDLStyle style,
    String prototypeNodeUUID,
    this.value,
  ) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          type,
          style,
          prototypeNodeUUID,
        ) {
    properties ??= [];
  }
}
