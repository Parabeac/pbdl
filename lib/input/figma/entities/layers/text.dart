import 'package:pbdl/input/figma/entities/abstract_figma_node_factory.dart';
import 'package:pbdl/input/figma/entities/layers/frame.dart';
import 'package:pbdl/input/figma/entities/layers/vector.dart';
import 'package:pbdl/input/figma/entities/style/figma_style.dart';
import 'package:pbdl/input/figma/helper/style_extractor.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'figma_node.dart';

part 'text.g.dart';

@JsonSerializable()
class FigmaText extends FigmaVector implements AbstractFigmaNodeFactory {
  @override
  String type = 'TEXT';
  FigmaText(
      {String name,
      bool visible,
      String type,
      pluginData,
      sharedPluginData,
      FigmaStyle this.style,
      layoutAlign,
      constraints,
      FigmaFrame boundaryRectangle,
      size,
      fills,
      strokes,
      strokeWeight,
      strokeAlign,
      styles,
      this.content,
      this.characterStyleOverrides,
      this.styleOverrideTable,
      String prototypeNodeUUID,
      num transitionDuration,
      String transitionEasing})
      : super(
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
    pbdfType = 'text';
  }

  @JsonKey(name: 'characters')
  String content;

  @override
  FigmaStyle style;

  List<double> characterStyleOverrides;

  Map styleOverrideTable;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaText.fromJson(json);
    node.style = StyleExtractor().getStyle(json);
    return node;
  }

  factory FigmaText.fromJson(Map<String, dynamic> json) =>
      _$FigmaTextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaTextToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    /*
    return Future.value(InheritedContainer(
      this,
      Point(boundaryRectangle.x, boundaryRectangle.y),
      Point(boundaryRectangle.x + boundaryRectangle.width,
          boundaryRectangle.y + boundaryRectangle.height),
      name,
      currentContext: currentContext,
      isBackgroundVisible: style.backgroundColor != null,
    )..addChild(
        InheritedText(this, name, currentContext: currentContext),
      )); */
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'text';

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

  @override
  var attributedString;

  @override
  var automaticallyDrawOnUnderlyingPath;

  @override
  var dontSynchroniseWithSymbol;

  @override
  var glyphBounds;

  @override
  var lineSpacingBehaviour;

  @override
  var textBehaviour;
}
