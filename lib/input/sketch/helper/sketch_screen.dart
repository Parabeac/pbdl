
import 'package:pbdl/pbdl/pbdl_screen.dart';

class SketchScreen extends DesignScreen {
  SketchScreen(
    DesignNode root,
    String id,
    String name,
    String type,
  ) : super(
          designNode: root,
          id: id,
          name: name,
          type: type,
        );
}
