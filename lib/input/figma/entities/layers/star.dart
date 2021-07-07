import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import '../abstract_figma_node_factory.dart';
import 'figma_node.dart';
import 'frame.dart';
import 'vector.dart';

part 'star.g.dart';

@JsonSerializable()
class FigmaStar extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String type = 'STAR';
  FigmaStar({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    style,
    layoutAlign,
    constraints,
    FigmaFrame boundaryRectangle,
    size,
    fills,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    String prototypeNodeUUID,
    num transitionDuration,
    String transitionEasing,
  }) : super(
          name: name,
          visible: visible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          style: style,
          layoutAlign: layoutAlign,
          constraints: constraints,
          boundaryRectangle: boundaryRectangle,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          prototypeNodeUUID: prototypeNodeUUID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
        ) {
    pbdfType = 'star';
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaStar.fromJson(json);
  factory FigmaStar.fromJson(Map<String, dynamic> json) =>
      _$FigmaStarFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaStarToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    /*
    imageReference = FigmaAssetProcessor().processImage(UUID);
    return Future.value(InheritedBitmap(
      this,
      name,
      currentContext: currentContext,
      referenceImage: imageReference,
    )); */
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'star';
}
