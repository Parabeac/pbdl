import 'package:pbdl/pbdl.dart';

import 'pbdl_artboard.dart';
import 'pbdl_boolean_operation.dart';
import 'pbdl_group_node.dart';
import 'pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'pbdl_oval.dart';
import 'pbdl_page.dart';
import 'pbdl_project.dart';
import 'pbdl_screen.dart';
import 'pbdl_shared_instance_node.dart';
import 'pbdl_shared_master_node.dart';
import 'pbdl_polygon.dart';
import 'pbdl_rectangle.dart';
import 'pbdl_star.dart';
import 'pbdl_text.dart';
import 'pbdl_vector.dart';

class AbstractPBDLNodeFactory {
  static final String DESIGN_CLASS_KEY = 'pbdlType';

  static final List<PBDLNode> _designNodes = [
    PBDLArtboard(),
    PBDLBooleanOperation(),
    PBDLGroupNode(),
    PBDLImage(),
    PBDLOval(),
    PBDLSharedInstanceNode(),
    PBDLSharedMasterNode(),
    PBDLPolygon(),
    PBDLRectangle(),
    PBDLStar(),
    PBDLText(),
    PBDLVector(),
    PBDLProject(),
    PBDLPage(),
    PBDLScreen(),
    PBDLFrame(),
    PBDLRow(),
    PBDLCol(),
  ];

  AbstractPBDLNodeFactory();

  static PBDLNode? getPBDLNode(Map<String, dynamic> json) {
    var className = json[DESIGN_CLASS_KEY];
    if (className != null) {
      for (var designNode in _designNodes) {
        if (designNode.pbdlType == className) {
          return designNode.createPBDLNode(json);
        }
      }
    }
    return null;
  }
}

abstract class PBDLNodeFactory {
  PBDLNode createPBDLNode(Map<String, dynamic> json);
}
