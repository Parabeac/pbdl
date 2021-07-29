import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_artboard.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/color.dart';
import '../style/style.dart';
import 'abstract_group_layer.dart';
import 'sketch_node.dart';
import 'flow.dart';

part 'artboard.g.dart';

@JsonSerializable()
class Artboard extends AbstractGroupLayer implements SketchNodeFactory {
  @override
  @JsonKey(name: 'layers')
  List<SketchNode> children;

  @override
  String CLASS_NAME = 'artboard';
  @override
  @JsonKey(name: '_class')
  String type;
  final bool includeInCloudUpload;
  final bool includeBackgroundColorInExport;
  final dynamic horizontalRulerData;
  final dynamic verticalRulerData;
  final dynamic layout;
  final dynamic grid;

  @override
  @JsonKey(name: 'frame')
  SketchRect boundaryRectangle;

  Color backgroundColor;

  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  final bool hasBackgroundColor;
  final bool isFlowHome;
  final bool resizesContent;
  final dynamic presetDictionary;

  bool _isVisible;

  Style _style;

  @override
  void set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style get style => _style;

  Artboard(
      {this.includeInCloudUpload,
      this.includeBackgroundColorInExport,
      this.horizontalRulerData,
      this.verticalRulerData,
      this.layout,
      this.grid,
      Color this.backgroundColor,
      this.hasBackgroundColor,
      this.isFlowHome,
      this.resizesContent,
      this.presetDictionary,
      hasClickThrough,
      groupLayout,
      this.children,
      this.UUID,
      booleanOperation,
      exportOptions,
      this.boundaryRectangle,
      Flow flow,
      isFixedToViewport,
      isFlippedHorizontal,
      isFlippedVertical,
      isLocked,
      isVisible,
      layerListExpandedType,
      name,
      nameIsFixed,
      resizingConstraint,
      resizingType,
      rotation,
      sharedStyleID,
      shouldBreakMaskChain,
      hasClippingMask,
      clippingMaskMode,
      userInfo,
      Style style,
      maintainScrollPosition})
      : _isVisible = isVisible,
        _style = style,
        super(
            hasClickThrough,
            groupLayout,
            (children as List<SketchNode>),
            UUID,
            booleanOperation,
            exportOptions,
            boundaryRectangle as SketchRect,
            flow,
            isFixedToViewport,
            isFlippedHorizontal,
            isFlippedVertical,
            isLocked,
            isVisible,
            layerListExpandedType,
            name,
            nameIsFixed,
            resizingConstraint,
            resizingType,
            rotation,
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition);

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      Artboard.fromJson(json);
  factory Artboard.fromJson(Map<String, dynamic> json) =>
      _$ArtboardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ArtboardToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    return Future.value(PBDLArtboard(
      backgroundColor: backgroundColor.interpretColor(),
      isFlowHome: isFlowHome,
      hasClickThrough: hasClickThrough,
      groupLayout: groupLayout,
      UUID: UUID,
      booleanOperation: booleanOperation,
      exportOptions: exportOptions,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      flow: flow?.interpretFlow(),
      isFixedToViewport: isFixedToViewport,
      isFlippedHorizontal: isFlippedHorizontal,
      isFlippedVertical: isFlippedVertical,
      isLocked: isLocked,
      isVisible: isVisible,
      layerListExpandedType: layerListExpandedType,
      name: name,
      nameIsFixed: nameIsFixed,
      resizingConstraint: resizingConstraint,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMaskMode,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      prototypeNodeUUID: flow?.destinationArtboardID,
      style: style.interpretStyle(),
      children: await Future.wait(
          children.map((e) async => await e.interpretNode()).toList()),
    ));
  }

  set isFlowHome(_isFlowHome) {
    // TODO: implement isFlowHome
  }
}
