import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/helper/figma_asset_processor.dart';
import 'package:pbdl/src/pbdl/pbdl_group_node.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';

import '../../helper/figma_rect.dart';
import '../abstract_figma_node_factory.dart';
import '../style/figma_color.dart';
import 'figma_node.dart';
import 'figma_frame.dart';
import 'text.dart';
import 'vector.dart';

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

  Group(
      {name,
      isVisible,
      type,
      pluginData,
      sharedPluginData,
      boundaryRectangle,
      style,
      fills,
      strokes,
      strokeWeight,
      strokeAlign,
      cornerRadius,
      constraints,
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
      String transitionEasing})
      : super(
            name: name,
            isVisible: isVisible,
            type: type,
            pluginData: pluginData,
            sharedPluginData: sharedPluginData,
            boundaryRectangle: boundaryRectangle != null
                ? FigmaRect.fromJson(boundaryRectangle)
                : null,
            style: style,
            fills: fills,
            strokes: strokes,
            strokeWeight: strokeWeight,
            strokeAlign: strokeAlign,
            cornerRadius: cornerRadius,
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
      imageReference = FigmaAssetProcessor().processImage(UUID);

      var tempPrototypeID = childrenHavePrototypeNode();
      if (tempPrototypeID != null) {
        transitionNodeID = tempPrototypeID;
      }

      if (children != null && children.isNotEmpty) {
        boundaryRectangle = fitFrame();
      }

      children.clear();

      return Future.value(
        PBDLImage(
          imageReference: imageReference,
          UUID: UUID,
          boundaryRectangle: boundaryRectangle.interpretFrame(),
          isVisible: isVisible,
          name: name,
          style: style?.interpretStyle(),
          prototypeNodeUUID: transitionNodeID,
        ),
      );
    }
    return Future.value(
      PBDLGroupNode(
        UUID: UUID,
        boundaryRectangle: boundaryRectangle.interpretFrame(),
        isVisible: isVisible,
        name: name,
        style: style?.interpretStyle(),
        prototypeNodeUUID: transitionNodeID,
        children: await Future.wait(
          children.map((e) async => await e.interpretNode()).toList(),
        ),
      ),
    );
  }

  bool areAllVectors() {
    if (children == null) {
      return false;
    }
    for (var child in children) {
      if (child is! FigmaVector) {
        return false;
      }
      if (child is FigmaText) {
        return false;
      }
    }
    return true;
  }

  FigmaRect fitFrame() {
    var heights = [];
    var widths = [];
    for (var child in children) {
      heights.add(child.boundaryRectangle.height);
      widths.add(child.boundaryRectangle.width);
    }

    if (heights.every((element) => element == heights[0]) &&
        widths.every((element) => element == widths[0])) {
      return FigmaRect(
        height: heights[0],
        width: widths[0],
        x: boundaryRectangle.x,
        y: boundaryRectangle.y,
      );
    } else {
      return boundaryRectangle;
    }
  }

  String childrenHavePrototypeNode() {
    for (child in children) {
      if (child.transitionNodeID != null) {
        return child.transitionNodeID;
      }
    }
    return null;
  }
}
