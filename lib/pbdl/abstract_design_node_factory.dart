import 'package:parabeac_core/input/helper/design_page.dart';
import 'package:parabeac_core/input/helper/design_project.dart';
import 'package:parabeac_core/input/helper/design_screen.dart';
import 'package:pbdl/design_logic/pbdl_node.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'artboard.dart';
import 'boolean_operation.dart';
import 'design_node.dart';
import 'group_node.dart';
import 'image.dart';
import 'oval.dart';
import 'pb_shared_instance_design_node.dart';
import 'pb_shared_master_node.dart';
import 'polygon.dart';
import 'rectangle.dart';
import 'star.dart';
import 'text.dart';
import 'vector.dart';

class AbstractDesignNodeFactory {
  static final String DESIGN_CLASS_KEY = 'pbdfType';

  static final List<PBDLNodeFactory> _designNodes = [
    PBArtboard(),
    BooleanOperation(),
    GroupNode(),
    PBDLImage(),
    Oval(),
    PBSharedInstanceDesignNode(),
    PBSharedMasterDesignNode(),
    Polygon(),
    Rectangle(),
    Star(),
    Text(),
    Vector(),
    DesignProject(),
    DesignPage(),
    DesignScreen(),
  ];

  AbstractDesignNodeFactory();

  static PBDLNode getDesignNode(Map<String, dynamic> json) {
    var className = json[DESIGN_CLASS_KEY];
    if (className != null) {
      for (var designNode in _designNodes) {
        if (designNode.pbdfType == className) {
          return designNode.createDesignNode(json);
        }
      }
    }
    return null;
  }
}

abstract class PBDLNodeFactory {
  String pbdfType;
  PBDLNode createDesignNode(Map<String, dynamic> json);
}
