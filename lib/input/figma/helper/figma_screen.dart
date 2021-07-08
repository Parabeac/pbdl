

import 'package:pbdl/pbdl/pbdl_node.dart';
import 'package:pbdl/pbdl/pbdl_screen.dart';

class FigmaScreen extends DesignScreen {
  FigmaScreen(
    PBDLNode root,
    String id,
    String name,
  ) : super(
          designNode: root,
          id: id,
          name: name,
        );
}
