import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

import 'abstract_design_node_factory.dart';

class BooleanOperation implements PBDLNodeFactory, PBDLNode {
  @override
  String pbdfType = 'boolean_operation';
  List<PBDLNode> children = [];

  @override
  var boundaryRectangle;

  BooleanOperation({
    booleanOperation,
    type,
    PBDLFrame this.boundaryRectangle,
    String UUID,
    String this.name,
    bool isVisible,
    pbdfType,
  });

  @override
  Future<PBDLNode> interpretNode() async {
    /* var img = await AzureAssetService().downloadImage(UUID);
    var file =
        File('${MainInfo().outputPath}pngs/${UUID}.png'.replaceAll(':', '_'))
          ..createSync(recursive: true);
    file.writeAsBytesSync(img);

    return Future.value(InheritedBitmap(
      this,
      name,
      currentContext: currentContext,
    ));*/
  }

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) {}

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   var node = BooleanOperation(
  //     booleanOperation: json['booleanOperation'],
  //     type: json['type'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     UUID: json['id'] as String,
  //     name: json['name'] as String,
  //     isVisible: json['visible'] as bool ?? true,
  //     pbdfType: json['pbdfType'] as String,
  //   );
  //   if (json.containsKey('children')) {
  //     if (json['children'] != null) {
  //       node.children
  //           .add(DesignNode.fromPBDF(json['children'] as Map<String, dynamic>));
  //     }
  //   }
  //   return node;
  // }

  @override
  String UUID;

  @override
  String name;

  @override
  String prototypeNodeUUID;

  @override
  PBStyle style;

  @override
  String type;

  @override
  toJson() {
    throw UnimplementedError();
  }

  @override
  bool isVisible;
}
