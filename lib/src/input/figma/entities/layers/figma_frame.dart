import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/input/figma/entities/layers/ellipse.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_children_node.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_constraints.dart';
import 'package:pbdl/src/input/figma/entities/layers/rectangle.dart';
import 'package:pbdl/src/input/figma/entities/layers/text.dart';
import 'package:pbdl/src/input/figma/entities/layers/vector.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_auto_layout_options.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_color.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/input/figma/helper/figma_rect.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';

part 'figma_frame.g.dart';

@JsonSerializable(explicitToJson: true)
class FigmaFrame extends FigmaChildrenNode
    with PBColorMixin
    implements FigmaNodeFactory {
  @JsonKey()
  @override
  FigmaRect absoluteBoundingBox;

  var strokes;

  double strokeWeight;

  String strokeAlign;

  double cornerRadius;

  var size;

  double horizontalPadding;

  double verticalPadding;

  double itemSpacing;

  FigmaColor backgroundColor;

  @override
  String type = 'FRAME';

  @JsonKey(ignore: true)
  bool isRoot = false;

  @JsonKey(defaultValue: false)
  var isFlowHome = false;

  @JsonKey(ignore: true)
  FigmaAutoLayoutOptions autoLayoutOptions;

  FigmaFrame({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    this.absoluteBoundingBox,
    FigmaConstraints constraints,
    layoutAlign,
    layoutGrow,
    this.size,
    this.horizontalPadding,
    this.verticalPadding,
    this.itemSpacing,
    List<FigmaNode> children,
    String UUID,
    this.backgroundColor,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
  }) : super(name, isVisible, type, pluginData, sharedPluginData,
            UUID: UUID,
            transitionNodeID: transitionNodeID,
            transitionDuration: transitionDuration,
            transitionEasing: transitionEasing,
            children: children,
            constraints: constraints,
            layoutAlign: layoutAlign,
            layoutGrow: layoutGrow);

  @JsonKey(ignore: true)
  List points;

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) {
    var node = FigmaFrame.fromJson(json);
    if (json.containsKey('layoutMode')) {
      node.autoLayoutOptions = FigmaAutoLayoutOptions.fromJson(json);
    }
    return node;
  }

  factory FigmaFrame.fromJson(Map<String, dynamic> json) =>
      _$FigmaFrameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FigmaFrameToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    if (isRoot) {
      return Future.value(
        PBDLArtboard(
            backgroundColor: backgroundColor.interpretColor(),
            isFlowHome: false,
            UUID: UUID,
            boundaryRectangle: absoluteBoundingBox.interpretFrame(),
            isVisible: isVisible,
            name: name,
            style: figmaStyleProperty.interpretStyle(),
            prototypeNodeUUID: transitionNodeID,
            constraints: constraints?.interpret(),
            layoutMainAxisSizing: getGrowSizing(layoutGrow),
            layoutCrossAxisSizing: getAlignSizing(layoutAlign),
            children: await Future.wait(
                children.map((e) async => await e.interpretNode()).toList())),
      );
    } else {
      if (areAllVectors()) {
        imageReference = FigmaAssetProcessor().processImage(
          UUID,
          absoluteBoundingBox: absoluteBoundingBox,
          name: name,
          format: IMAGE_FORMAT.SVG,
          effects: figmaStyleProperty?.effects ?? [],
        );

        var tempPrototypeID = childrenHavePrototypeNode();
        if (tempPrototypeID != null) {
          transitionNodeID = tempPrototypeID;
        }

        if (children != null && children.isNotEmpty) {
          absoluteBoundingBox = fitFrame();
        }

        children.clear();

        return Future.value(
          PBDLImage(
            imageReference: imageReference,
            UUID: UUID,
            boundaryRectangle: absoluteBoundingBox.interpretFrame(),
            isVisible: isVisible,
            name: name,
            style: figmaStyleProperty?.interpretStyle(),
            constraints: constraints?.interpret(),
            prototypeNodeUUID: transitionNodeID,
            layoutMainAxisSizing: getGrowSizing(layoutGrow),
            layoutCrossAxisSizing: getAlignSizing(layoutAlign),
          ),
        );
      } else {
        return Future.value(
          PBDLFrame(
              UUID: UUID,
              boundaryRectangle: absoluteBoundingBox.interpretFrame(),
              isVisible: isVisible,
              name: name,
              style: figmaStyleProperty.interpretStyle(),
              prototypeNodeUUID: transitionNodeID,
              constraints: constraints?.interpret(),
              autoLayoutOptions: autoLayoutOptions?.interpretOptions(),
              layoutMainAxisSizing: getGrowSizing(layoutGrow),
              layoutCrossAxisSizing: getAlignSizing(layoutAlign),
              children: await Future.wait(
                  children.map((e) async => await e.interpretNode()).toList())),
        );
      }
    }
  }

  String imageReference;

  Map<String, dynamic> toPBDF() => toJson();

  bool areAllVectors() {
    if (children == null) {
      return false;
    }
    for (var child in children) {
      if (child is FigmaText ||
          child is! FigmaVector ||
          child is FigmaRectangle ||
          child is FigmaEllipse) {
        return false;
      }
    }
    return true;
  }

  String childrenHavePrototypeNode() {
    for (child in children) {
      if (child.transitionNodeID != null) {
        return child.transitionNodeID;
      }
    }
    return null;
  }

  FigmaRect fitFrame() {
    var heights = [];
    var widths = [];
    for (var child in children) {
      heights.add(child.absoluteBoundingBox.height);
      widths.add(child.absoluteBoundingBox.width);
    }

    if (heights.every((element) => element == heights[0]) &&
        widths.every((element) => element == widths[0])) {
      return FigmaRect(
        height: heights[0],
        width: widths[0],
        x: absoluteBoundingBox.x,
        y: absoluteBoundingBox.y,
      );
    } else {
      return absoluteBoundingBox;
    }
  }
}
