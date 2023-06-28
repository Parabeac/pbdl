import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_auto_layout_options.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_frame.g.dart';

@JsonSerializable(explicitToJson: true)

/// For the [PBDLFrame]s we are mostly sticking to Figmas current definition of a `Frame`. It's as follows:
/// ```text
/// The frame node is a container used to define a layout hierarchy. It is similar to <div> in HTML. It is different from GroupNode, which is closer to a folder for layers.
/// Frames generally have their own size, though the size can be determined by that of its children in the case of auto-layout frames.
/// ```
/// - One important thing to note is that [PBDLFrame] contains [PBDLConstraints], one things that differenciates from [PBDLGroup].
class PBDLFrame extends PBDLNode implements PBDLNodeFactory {
  List<PBDLNode?>? children = [];
  @override
  String? pbdlType = 'frame';

  @override
  @JsonKey(ignore: true)
  PBDLNode? child;

  num? fixedRadius;

  Map? background;

  @JsonKey()
  PBDLAutoLayoutOptions? autoLayoutOptions;

  PBDLFrame({
    bool? hasClickThrough,
    groupLayout,
    String UUID = '',
    booleanOperation,
    exportOptions,
    PBDLBoundaryBox? boundaryRectangle,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    bool? isVisible,
    layerListExpandedType,
    String? name,
    nameIsFixed,
    PBDLConstraints? constraints,
    resizingType,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    PBDLStyle? style,
    this.children,
    String? prototypeNodeUUID,
    this.fixedRadius,
    this.background,
    this.autoLayoutOptions,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          constraints: constraints,
          layoutMainAxisSizing: layoutMainAxisSizing,
          layoutCrossAxisSizing: layoutCrossAxisSizing,
        ) {
    if (autoLayoutOptions != null) {
      switch (autoLayoutOptions!.orientation) {
        case Orientation.HORIZONTAL:
          pbdlType = 'row';
          break;
        case Orientation.VERTICAL:
          pbdlType = 'col';
          break;
        default:
      }
    }
  }

  @override
  PBDLFrame createPBDLNode(Map<String, dynamic> json) {
    if (json['autoLayoutOptions'] != null &&
        json['autoLayoutOptions'].containsKey('orientation')) {
      if (json['autoLayoutOptions']['orientation'] == 'VERTICAL') {
        return PBDLCol.fromJson(json);
      } else if (json['autoLayoutOptions']['orientation'] == 'HORIZONTAL') {
        return PBDLRow.fromJson(json);
      }
    }
    return PBDLFrame.fromJson(json);
  }

  static PBDLFrame getFrame(dynamic boundaryRectangle) {
    if (boundaryRectangle is Map) {
      return PBDLFrame.fromJson(boundaryRectangle as Map<String, dynamic>);
    }
    return boundaryRectangle;
  }

  factory PBDLFrame.fromJson(Map<String, dynamic> json) =>
      _$PBDLFrameFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLFrameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PBDLRow extends PBDLFrame {
  PBDLRow();

  @override
  String? pbdlType = 'row';

  factory PBDLRow.fromJson(Map<String, dynamic> json) =>
      _$PBDLRowFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLRowToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PBDLCol extends PBDLFrame {
  PBDLCol();

  @override
  String? pbdlType = 'col';

  factory PBDLCol.fromJson(Map<String, dynamic> json) =>
      _$PBDLColFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLColToJson(this);
}
