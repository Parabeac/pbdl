import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_image.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:path/path.dart' as p;
import 'package:pbdl/src/util/main_info.dart';

import '../abstract_sketch_node_factory.dart';
import '../objects/sketch_rect.dart';
import '../style/style.dart';
import 'flow.dart';
import 'sketch_node.dart';

part 'bitmap.g.dart';

@JsonSerializable()

// title: Bitmap Layer
// description: Bitmap layers house a single image
class Bitmap extends SketchNode implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'bitmap';
  final bool fillReplacesImage;
  final int intendedDPI;
  final dynamic clippingMask;

  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;

  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  Bitmap({
    this.imageReference,
    this.fillReplacesImage,
    this.intendedDPI,
    this.clippingMask,
    this.UUID,
    booleanOperation,
    exportOptions,
    SketchRect this.boundaryRectangle,
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
    num rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    Style style,
    maintainScrollPosition,
    this.imageReferenceMap = const {},
  })  : _isVisible = isVisible,
        _style = style,
        super(
            UUID,
            booleanOperation,
            exportOptions,
            boundaryRectangle,
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
            rotation?.toDouble(),
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition) {
    imageReference ??= imageReferenceMap['_ref'];
  }

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      Bitmap.fromJson(json);
  factory Bitmap.fromJson(Map<String, dynamic> json) => _$BitmapFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BitmapToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    imageReference = p.join(MainInfo().pngPath, p.basename(imageReference));
    return Future.value(PBDLImage(
      imageReference: imageReference,
      UUID: UUID,
      booleanOperation: booleanOperation,
      exportOptions: exportOptions,
      boundaryRectangle: boundaryRectangle.interpretFrame(),
      isFixedToViewport: isFixedToViewport,
      isFlippedHorizontal: isFlippedHorizontal,
      isFlippedVertical: isFlippedVertical,
      isLocked: isLocked,
      layerListExpandedType: layerListExpandedType,
      name: name,
      nameIsFixed: nameIsFixed,
      resizingConstraint: resizingConstraint,
      resizingType: resizingType,
      rotation: rotation,
      sharedStyleID: sharedStyleID,
      shouldBreakMaskChain: shouldBreakMaskChain,
      hasClippingMask: hasClippingMask,
      clippingMaskMode: clippingMask,
      userInfo: userInfo,
      maintainScrollPosition: maintainScrollPosition,
      style: style.interpretStyle(),
      prototypeNodeUUID: flow?.destinationArtboardID,
    ));
  }

  @JsonKey(name: 'image')
  Map imageReferenceMap;

  @JsonKey(ignore: true)
  String imageReference;

  @override
  @JsonKey(name: '_class')
  String type;

  bool _isVisible;

  Style _style;

  set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  set style(_style) => this._style = _style;

  @override
  Style get style => _style;
}
