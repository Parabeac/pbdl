import 'package:pbdl/src/input/sketch/entities/layers/abstract_group_layer.dart';
import 'package:pbdl/src/input/sketch/entities/layers/artboard.dart';
import 'package:pbdl/src/input/sketch/entities/layers/group.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../entities/layers/symbol_master.dart';

///Class for cleansing the positional data of the [DesignNode]
/// TODO: (Eddie): Abstract it, not only for Sketch node but potentially more design files.
class PositionalCleansingService {
  ///Eliminating the offset of the nodes. NOTE: the only nodes that have an offset are [Artboard] and [Group]
  SketchNode eliminateOffset(SketchNode rootNode) {
    if (rootNode is Group || rootNode is Artboard || rootNode is SymbolMaster) {
      _eliminateOffsetChildren(
          (rootNode as AbstractGroupLayer).children, rootNode);
    }
    if (rootNode is AbstractGroupLayer) {
      rootNode.children.map((layerNode) => eliminateOffset(layerNode)).toList();
    }
    return rootNode;
  }

  void _eliminateOffsetChildren(List children, SketchNode parent) =>
      children.forEach((child) {
        child.absoluteBoundingBox.x =
            (parent.boundaryRectangle.x + child.absoluteBoundingBox.x);
        child.absoluteBoundingBox.y =
            (parent.boundaryRectangle.y + child.absoluteBoundingBox.y);
      });
}
