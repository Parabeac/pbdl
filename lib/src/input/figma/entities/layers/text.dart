import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_text.dart';
import '../../helper/style_extractor.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_style.dart';
import 'figma_node.dart';
import 'vector.dart';

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
      boundaryRectangle,
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
          boundaryRectangle: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
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
  @JsonKey(ignore: true)
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
    return Future.value(
      PBDLText(
        UUID: UUID,
        boundaryRectangle: boundaryRectangle.interpretFrame(),
        isVisible: isVisible,
        name: name,
        attributedString: attributedString,
        automaticallyDrawOnUnderlyingPath: automaticallyDrawOnUnderlyingPath,
        dontSynchroniseWithSymbol: dontSynchroniseWithSymbol,
        lineSpacingBehaviour: lineSpacingBehaviour,
        textBehaviour: textBehaviour,
        glyphBounds: glyphBounds,
        pbdfType: pbdfType,
        style: style.interpretStyle(),
      ),
    );
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  @override
  String pbdfType = 'text';

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
