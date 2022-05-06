import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';

import 'layers/boolean_operation.dart';
import 'layers/canvas.dart';
import 'layers/component.dart';
import 'layers/component_set.dart';
import 'layers/ellipse.dart';
import 'layers/figma_node.dart';
import 'layers/figma_frame.dart';
import 'layers/group.dart';
import 'layers/instance.dart';
import 'layers/line.dart';
import 'layers/rectangle.dart';
import 'layers/regular_polygon.dart';
import 'layers/star.dart';
import 'layers/text.dart';
import 'layers/vector.dart';

class AbstractFigmaNodeFactory {
  static final String FIGMA_CLASS_KEY = 'type';

  static final List<FigmaBaseNode> _figmaNodes = [
    BooleanOperation(),
    Canvas(),
    Component(),
    FigmaEllipse(),
    FigmaFrame(),
    Group(),
    Instance(),
    FigmaLine(),
    FigmaRectangle(),
    // FigmaSlice(),
    FigmaStar(),
    FigmaText(),
    FigmaVector(),
    FigmaRegularPolygon(),
    FigmaComponentSet(),
  ];

  AbstractFigmaNodeFactory();

  static FigmaNode getFigmaNode(Map<String, dynamic> json) {
    var className = json[FIGMA_CLASS_KEY];
    if (className != null) {
      for (var figmaNode in _figmaNodes) {
        if (figmaNode.type == className) {
          var node = figmaNode.createFigmaNode(json);
          return node;
        }
      }
    }
    return null;
  }
}
