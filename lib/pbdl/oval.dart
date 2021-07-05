import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';

import 'package:json_annotation/json_annotation.dart';

part 'oval.g.dart';

@JsonSerializable()
class Oval implements PBDLNodeFactory, PBDLNode {
  @override
  String pbdfType = 'oval';

  var boundaryRectangle;

  var UUID;

  Oval({
    bool edited,
    bool isClosed,
    pointRadiusBehaviour,
    List points,
    this.UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame this.boundaryRectangle,
    isFixedToViewport,
    isFlippedHorizontal,
    isFlippedVertical,
    isLocked,
    this.isVisible,
    layerListExpandedType,
    this.name,
    nameIsFixed,
    resizingConstraint,
    resizingType,
    rotation,
    sharedStyleID,
    shouldBreakMaskChain,
    hasClippingMask,
    clippingMaskMode,
    userInfo,
    maintainScrollPosition,
    type,
    this.pbdfType = 'oval',
    this.style,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => Oval.fromJson(json);
  factory Oval.fromJson(Map<String, dynamic> json) => _$OvalFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$OvalToJson(this);

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   return Oval(
  //     edited: json['edited'] as bool,
  //     isClosed: json['isClosed'] as bool,
  //     pointRadiusBehaviour: json['pointRadiusBehaviour'],
  //     points: json['points'] as List,
  //     UUID: json['id'] as String,
  //     booleanOperation: json['booleanOperation'],
  //     exportOptions: json['exportOptions'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     isFixedToViewport: json['isFixedToViewport'],
  //     isFlippedHorizontal: json['isFlippedHorizontal'],
  //     isFlippedVertical: json['isFlippedVertical'],
  //     isLocked: json['isLocked'],
  //     isVisible: json['visible'],
  //     layerListExpandedType: json['layerListExpandedType'],
  //     name: json['name'],
  //     nameIsFixed: json['nameIsFixed'],
  //     resizingConstraint: json['resizingConstraint'],
  //     resizingType: json['resizingType'],
  //     rotation: json['rotation'],
  //     sharedStyleID: json['sharedStyleID'],
  //     shouldBreakMaskChain: json['shouldBreakMaskChain'],
  //     hasClippingMask: json['hasClippingMask'],
  //     clippingMaskMode: json['clippingMaskMode'],
  //     userInfo: json['userInfo'],
  //     maintainScrollPosition: json['maintainScrollPosition'],
  //     type: json['type'] as String,
  //     pbdfType: json['pbdfType'] as String,
  //     style: json['style'] == null
  //         ? null
  //         : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
  //   );
  // }

  @override
  bool isVisible;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBStyle style;

  @override
  String type;

  @override
  Future<PBDLNode> interpretNode() async {
    /*var img = await AzureAssetService().downloadImage(UUID);

    return Future.value(
        InheritedOval(this, name, currentContext: currentContext, image: img)); */
  }
}
