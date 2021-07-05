import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/layers/vector.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'figma_node.dart';

part 'regular_polygon.g.dart';

@JsonSerializable()
class FigmaRegularPolygon extends FigmaVector
    implements AbstractFigmaNodeFactory {
  @override
  String type = 'REGULAR_POLYGON';
  FigmaRegularPolygon({
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
    pbdfType = 'polygon';
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) =>
      FigmaRegularPolygon.fromJson(json);
  factory FigmaRegularPolygon.fromJson(Map<String, dynamic> json) =>
      _$FigmaRegularPolygonFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaRegularPolygonToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    /*
    imageReference = FigmaAssetProcessor().processImage(UUID);

    return Future.value(
        InheritedBitmap(this, name, currentContext: currentContext)); */
  }

  @override
  String imageReference;

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'polygon';

  // @override
  // DesignNode createDesignNode(Map<String, dynamic> json) {
  //   // TODO: implement createDesignNode
  //   throw UnimplementedError();
  // }

  // @override
  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   // TODO: implement fromPBDF
  //   throw UnimplementedError();
  // }
}
