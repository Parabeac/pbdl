import 'package:pbdl/input/figma/entities/layers/boolean_operation.dart';
import 'package:pbdl/input/figma/entities/layers/canvas.dart';
import 'package:pbdl/input/figma/entities/layers/component.dart';
import 'package:pbdl/input/figma/entities/layers/ellipse.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/layers/group.dart';
import 'package:pbdl/input/figma/entities/layers/instance.dart';
import 'package:pbdl/input/figma/entities/layers/line.dart';
import 'package:pbdl/input/figma/entities/layers/rectangle.dart';
import 'package:pbdl/input/figma/entities/layers/regular_polygon.dart';
import 'package:pbdl/input/figma/entities/layers/slice.dart';
import 'package:pbdl/input/figma/entities/layers/star.dart';
import 'package:pbdl/input/figma/entities/layers/text.dart';
import 'package:pbdl/input/figma/entities/layers/vector.dart';

import 'layers/figma_node.dart';

class AbstractFigmaNodeFactory {
  static final String FIGMA_CLASS_KEY = 'type';

  static final List<FigmaNodeFactory> _figmaNodes = [
    BooleanOperation(),
    Canvas(),
    Component(),
    FigmaEllipse(),
    FigmaFrame(),
    Group(),
    Instance(),
    FigmaLine(),
    FigmaRectangle(),
    FigmaSlice(),
    FigmaStar(),
    FigmaText(),
    FigmaVector(),
    FigmaRegularPolygon(),
  ];

  AbstractFigmaNodeFactory();

  static FigmaNode getFigmaNode(Map<String, dynamic> json) {
    var className = json[FIGMA_CLASS_KEY];
    if (className != null) {
      for (var figmaNode in _figmaNodes) {
        if (figmaNode.type == className) {
          return figmaNode.createFigmaNode(json);
        }
      }
    }
    return null;
  }
}

abstract class FigmaNodeFactory {
  String type;
  FigmaNode createFigmaNode(Map<String, dynamic> json);
}
