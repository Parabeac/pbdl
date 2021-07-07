import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'boolean_operation.g.dart';

@JsonSerializable()
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
  // PBDL node does not need interpretNode
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
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      BooleanOperation.fromJson(json);
  factory BooleanOperation.fromJson(Map<String, dynamic> json) =>
      _$BooleanOperationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BooleanOperationToJson(this);

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
  bool isVisible;
}
