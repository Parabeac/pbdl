
import 'package:pbdl/input/helper/design_screen.dart';

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
