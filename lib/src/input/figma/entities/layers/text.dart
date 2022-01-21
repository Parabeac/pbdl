import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_fill.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_text_style.dart';
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
  FigmaTextStyle style;

  @override
  List<FigmaFill> fills;

  @override
  String type = 'TEXT';
  FigmaText({
    String name,
    bool visible,
    String type,
    pluginData,
    sharedPluginData,
    this.style,
    FigmaConstraints constraints,
    boundaryRectangle,
    size,
    strokes,
    strokeWeight,
    strokeAlign,
    styles,
    this.content,
    this.characterStyleOverrides,
    this.styleOverrideTable,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
    layoutAlign,
    layoutGrow,
    this.fills,
  }) : super(
          name: name,
          visible: visible,
          type: type,
          pluginData: pluginData,
          sharedPluginData: sharedPluginData,
          constraints: constraints,
          absoluteBoundingBox: boundaryRectangle != null
              ? FigmaRect.fromJson(boundaryRectangle)
              : null,
          size: size,
          strokes: strokes,
          strokeWeight: strokeWeight,
          strokeAlign: strokeAlign,
          styles: styles,
          transitionNodeID: transitionNodeID,
          transitionDuration: transitionDuration,
          transitionEasing: transitionEasing,
          layoutAlign: layoutAlign,
          layoutGrow: layoutGrow,
        );

  @JsonKey(name: 'characters')
  String content;

  List<double> characterStyleOverrides;

  Map styleOverrideTable;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaText.fromJson(json);
    // node.style = StyleExtractor().getStyle(json);
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
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        // style: style.interpretStyle(), TODO: Fix style
        content: content,
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
      ),
    );
  }

  @override
  Map<String, dynamic> toPBDF() => toJson();

  var attributedString;

  var automaticallyDrawOnUnderlyingPath;

  var dontSynchroniseWithSymbol;

  var glyphBounds;

  var lineSpacingBehaviour;

  var textBehaviour;
}
