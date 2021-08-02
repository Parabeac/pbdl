import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/vector.dart';
import 'package:pbdl/src/input/figma/helper/overrides/figma_override_type.dart';
import 'package:pbdl/src/input/general_helper/overrides/pbdl_override_image.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

/// Map used to prevent duplicates when referencing override images
final _uuidToRef = <String, PBDLImage>{};

class FigmaOverrideImage extends FigmaOverrideType {
  @override
  Future<PBDLNode> getValue(FigmaNode node) async {
    if (!matches(node)) {
      return null;
    }
    if (_uuidToRef.containsKey(node.UUID)) {
      return Future.value(_uuidToRef[node.UUID]);
    }
    var interpretedNode = await (node as FigmaVector).interpretNode();

    if (interpretedNode is! PBDLImage) {
      return null;
    }
    _uuidToRef[interpretedNode.UUID] = interpretedNode as PBDLImage;
    return Future.value(_uuidToRef[interpretedNode.UUID]);
  }

  @override
  String getPBDLType() => PBDLOverrideImage.PBDL_TYPE_NAME;

  @override
  bool matches(FigmaNode node) => node is FigmaVector;

  @override
  PBDLStyle getPBDLStyle(FigmaNode node) {
    if (!matches(node)) {
      return null;
    }
    return (node as FigmaVector).style?.interpretStyle();
  }
}
