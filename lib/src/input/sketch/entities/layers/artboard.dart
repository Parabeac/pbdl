import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_artboard.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/frame.dart';
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
  List children;

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
  var boundaryRectangle;

  @override
  var backgroundColor;

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
      List<SketchNode> this.children,
      this.UUID,
      booleanOperation,
      exportOptions,
      Frame this.boundaryRectangle,
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
            boundaryRectangle as Frame,
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
    return PBDLArtboard(
      backgroundColor: backgroundColor,
      isFlowHome: false, // TODO: get it dynamically
      UUID: UUID,
      exportOptions: exportSettings,
      boundaryRectangle: boundaryRectangle,
      isVisible: isVisible,
      name: name,
      type: type,
      style: style, // TODO:
      prototypeNodeUUID: prototypeNodeUUID,
    );
    /*
    return Future.value(InheritedScaffold(
      this,
      currentContext: currentContext,
      name: name,
      isHomeScreen: isFlowHome,
    )); */
    
    /*
    assert(false, 'We don\'t product pages as Intermediate Nodes.');
    return null; */
  }


    
  

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'artboard';

  @override
  void set isFlowHome(_isFlowHome) {
    // TODO: implement isFlowHome
  }
}
