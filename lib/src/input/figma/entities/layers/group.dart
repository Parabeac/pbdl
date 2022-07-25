import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/style/figma_style_property.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_group_node.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';

import '../../helper/figma_rect.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_constraints.dart';
import 'figma_node.dart';
import 'figma_frame.dart';

part 'group.g.dart';

@JsonSerializable(explicitToJson: true)

/// Class that represents a Figma Group.
/// The reason this class implements Image is because Groups can hold multiple vectors
/// which we need to convert into images.
class Group extends FigmaFrame implements AbstractFigmaNodeFactory {
  @JsonKey(ignore: true)
  Logger log;
  @override
  String type = 'GROUP';

  @override
  String imageReference;

  @override
  @JsonKey(ignore: false)
  FigmaStyleProperty figmaStyleProperty;

  Group({
    name,
    isVisible,
    type,
    pluginData,
    sharedPluginData,
    boundaryRectangle,
    FigmaConstraints constraints,
    layoutAlign,
    size,
    horizontalPadding,
    verticalPadding,
    itemSpacing,
    List<FigmaNode> children,
    String UUID,
    FigmaColor backgroundColor,
    String transitionNodeID,
    num transitionDuration,
    String transitionEasing,
    figmaStyleProperty,
  }) : super(
            name: name,
            isVisible: isVisible,
            type: type,
            pluginData: pluginData,
            sharedPluginData: sharedPluginData,
            absoluteBoundingBox: boundaryRectangle != null
                ? FigmaRect.fromJson(boundaryRectangle)
                : null,
            constraints: constraints,
            layoutAlign: layoutAlign,
            size: size,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            itemSpacing: itemSpacing,
            children: children,
            UUID: UUID,
            backgroundColor: backgroundColor,
            transitionNodeID: transitionNodeID,
            transitionDuration: transitionDuration,
            transitionEasing: transitionEasing) {
    log = Logger(runtimeType.toString());
  }

  @override
  FigmaNode createFigmaNode(Map<String, dynamic> json) => Group.fromJson(json);
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
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
    }
    return Future.value(
      PBDLGroupNode(
        UUID: UUID,
        boundaryRectangle: absoluteBoundingBox.interpretFrame(),
        isVisible: isVisible,
        name: name,
        style: figmaStyleProperty?.interpretStyle(),
        prototypeNodeUUID: transitionNodeID,
        constraints: constraints?.interpret(),
        layoutMainAxisSizing: getGrowSizing(layoutGrow),
        layoutCrossAxisSizing: getAlignSizing(layoutAlign),
        children: await Future.wait(
          children.map((e) async => await e.interpretNode()).toList(),
        ),
      ),
    );
  }
}
