import 'package:pbdl/pbdl/color.dart';
import 'package:pbdl/pbdl/pbdl_flow.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';
import 'group_node.dart';

class PBArtboard extends PBDLNode implements GroupNode, PBDLNodeFactory {
  PBColor backgroundColor;
  @override
  var boundaryRectangle;
  var isFlowHome;

  var style;
  PBArtboard(
      {this.backgroundColor,
      this.isFlowHome,
      hasClickThrough,
      groupLayout,
      UUID,
      booleanOperation,
      exportOptions,
      PBDLFrame this.boundaryRectangle,
      PBDLFlow flow,
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
      maintainScrollPosition,
      prototypeNode,
      type,
      this.style})
      : super(UUID, name, isVisible, boundaryRectangle, type, style,
            prototypeNode);

  @override
  List children = [];

  @override
  String pbdfType = 'artboard';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) {}

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   var node = PBArtboard(
  //     backgroundColor: json['backgroundColor'] == null
  //         ? null
  //         : Color.fromJson(json['backgroundColor'] as Map<String, dynamic>),
  //     isFlowHome: json['isFlowHome'] as bool,
  //     hasClickThrough: json['hasClickThrough'],
  //     groupLayout: json['groupLayout'],
  //     UUID: json['id'] as String,
  //     booleanOperation: json['booleanOperation'],
  //     exportOptions: json['exportOptions'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     flow: json['flow'] == null
  //         ? null
  //         : Flow.fromJson(json['flow'] as Map<String, dynamic>),
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
  Future<PBDLNode> interpretNode() {
    /*
    return Future.value(InheritedScaffold(
      this,
      currentContext: currentContext,
      name: name,
      isHomeScreen: isFlowHome,
    ));
  } */
  }
}
