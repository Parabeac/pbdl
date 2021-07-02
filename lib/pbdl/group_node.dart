import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';

class GroupNode implements PBDLNodeFactory, PBDLNode {
  List children = [];

  @override
  String pbdfType = 'group';

  GroupNode({
    bool hasClickThrough,
    groupLayout,
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
    this.pbdfType = 'group',
    this.style,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) {}

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   var node = GroupNode(
  //     hasClickThrough: json['hasClickThrough'] as bool,
  //     groupLayout: json['groupLayout'],
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
  //     pbdfType: json['pbdfType'],
  //     style: json['style'] == null
  //         ? null
  //         : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
  //   )
  //     ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
  //     ..type = json['type'] as String;
  //   if (json.containsKey('children')) {
  //     if (json['children'] != null) {
  //       for (var item in json['children']) {
  //         var child = DesignNode.fromPBDF(item as Map<String, dynamic>);
  //         if (child != null) {
  //           node.children.add(child);
  //         }
  //       }
  //     }
  //   }
  //   return node;
  // }

  @override
  String UUID;

  @override
  var boundaryRectangle;

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
  Future<PBDLNode> interpretNode() {
    // Future.value(TempGroupLayoutNode(this, currentContext, name,
    //     topLeftCorner: Point(boundaryRectangle.x, boundaryRectangle.y),
    //     bottomRightCorner: Point(boundaryRectangle.x + boundaryRectangle.width,
    //         boundaryRectangle.y + boundaryRectangle.height)));
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
