import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vector.g.dart';

@JsonSerializable()
class Vector implements PBDLNodeFactory, PBDLNode, PBDLImage {
  @override
  String pbdfType = 'vector';

  var layoutAlign;

  var constraints;

  var size;

  var strokes;

  var strokeWeight;

  var strokeAlign;

  var styles;

  var fillsList;

  Vector({
    this.name,
    visible,
    this.type,
    pluginData,
    sharedPluginData,
    this.layoutAlign,
    this.constraints,
    PBDLFrame this.boundaryRectangle,
    this.size,
    this.strokes,
    this.strokeWeight,
    this.strokeAlign,
    this.styles,
    this.fillsList,
    this.UUID,
    this.pbdfType = 'vector',
    this.style,
  });

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => Vector.fromJson(json);
  factory Vector.fromJson(Map<String, dynamic> json) => _$VectorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$VectorToJson(this);

  // DesignNode fromPBDF(Map<String, dynamic> json) {
  //   return Vector(
  //     name: json['name'] as String,
  //     type: json['type'] as String,
  //     pluginData: json['pluginData'],
  //     sharedPluginData: json['sharedPluginData'],
  //     layoutAlign: json['layoutAlign'] as String,
  //     constraints: json['constraints'],
  //     boundaryRectangle: json['absoluteBoundingBox'] == null
  //         ? null
  //         : Frame.fromJson(json['absoluteBoundingBox'] as Map<String, dynamic>),
  //     size: json['size'],
  //     strokes: json['strokes'],
  //     strokeWeight: (json['strokeWeight'] as num)?.toDouble(),
  //     strokeAlign: json['strokeAlign'] as String,
  //     styles: json['styles'],
  //     fillsList: json['fills'] as List,
  //     UUID: json['id'] as String,
  //     pbdfType: json['pbdfType'],
  //     style: json['style'] == null
  //         ? null
  //         : PBStyle.fromPBDF(json['style'] as Map<String, dynamic>),
  //   )..type = json['type'] as String;
  // }

  @override
  String UUID;

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
    /*
    var img = await AzureAssetService().downloadImage(UUID);

    imageReference = AssetProcessingService.getImageName(UUID);

    var file =
        File('${MainInfo().outputPath}pngs/${UUID}.png'.replaceAll(':', '_'))
          ..createSync(recursive: true);
    file.writeAsBytesSync(img);
    return Future.value(
        InheritedBitmap(this, name, currentContext: currentContext)); */
  }

  @override
  var boundaryRectangle;

  @override
  String imageReference;
}
