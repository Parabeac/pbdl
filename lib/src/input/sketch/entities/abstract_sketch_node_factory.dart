import 'layers/artboard.dart';
import 'layers/bitmap.dart';
import 'layers/group.dart';
import 'layers/oval.dart';
import 'layers/page.dart';
import 'layers/polygon.dart';
import 'layers/rectangle.dart';
import 'layers/shape_group.dart';
import 'layers/shape_path.dart';
import 'layers/sketch_node.dart';
import 'layers/sketch_text.dart';
import 'layers/star.dart';
import 'layers/symbol_instance.dart';
import 'layers/symbol_master.dart';
import 'layers/triangle.dart';

///Abstract Factory for [SketchNode]
class AbstractSketchNodeFactory {
  ///the key that gives the class type in the `SketchFiles`.
  static final String SKETCH_CLASS_KEY = '_class';

  static final List<SketchNodeFactory> _sketchNodes = [
    Artboard(),
    Bitmap(),
    Group(),
    Oval(),
    Page(),
    Polygon(),
    Rectangle(),
    ShapeGroup(),
    ShapePath(),
    SymbolInstance(),
    SymbolMaster(),
    SketchText(),
    Star(),
    Triangle()
  ];

  AbstractSketchNodeFactory();

  static SketchNode getSketchNode(Map<String, dynamic> json) {
    var className = json[SKETCH_CLASS_KEY];
    if (className != null) {
      for (var sketchNode in _sketchNodes) {
        if (sketchNode.CLASS_NAME == className) {
          return sketchNode.createSketchNode(json);
        }
      }
    }
    return null;
  }
}

///Created another method for the factory because I could not access the regular
///factory constructor of each of the `SketchNode`s. Furthermore, the factory
///constructor creates less of an overhead (according to online docs). Regular
///method is just going to call the factory method.
abstract class SketchNodeFactory {
  String CLASS_NAME;
  dynamic createSketchNode(Map<String, dynamic> json);
}
