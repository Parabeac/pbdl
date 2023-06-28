import 'package:pbdl/pbdl.dart';


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
