import 'package:pbdl/pbdl/pbdl_node.dart';

abstract class DesignElement extends PBDLNode {
  DesignElement({
    UUID,
    name,
    isVisible,
    boundaryRectangle,
    type,
    style,
    prototypeNodeUUID,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          type,
          style,
          prototypeNodeUUID,
        );
}
