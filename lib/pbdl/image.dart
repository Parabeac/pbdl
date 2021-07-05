import 'package:pbdl/pbdl/pb_style.dart';
import 'package:pbdl/pbdl/pbdl_frame.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';
import 'abstract_design_node_factory.dart';
import 'design_element.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class PBDLImage extends DesignElement implements PBDLNodeFactory, PBDLNode {
  @override
  var style;

  PBDLImage({
    this.imageReference,
    UUID,
    booleanOperation,
    exportOptions,
    PBDLFrame boundaryRectangle,
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
    maintainScrollPosition,
    this.pbdfType = 'image',
    this.style,
  }) : super(
          UUID: UUID,
          name: name,
          isVisible: isVisible,
          boundaryRectangle: boundaryRectangle,
          style: style,
        );

  String imageReference;

  @override
  String pbdfType = 'image';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) =>
      PBDLImage.fromJson(json);
  factory PBDLImage.fromJson(Map<String, dynamic> json) =>
      _$PBDLImageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLImageToJson(this);

  @override
  Future<PBDLNode> interpretNode() async {
    /* try {
      var img = await AzureAssetService().downloadImage(UUID);
      var file =
          File('${MainInfo().outputPath}pngs/${UUID}.png'.replaceAll(':', '_'))
            ..createSync(recursive: true);
      file.writeAsBytesSync(img);
      return Future.value(InheritedBitmap(
        this,
        name,
        currentContext: currentContext,
      ));
    } catch (e) {
      var img = File(
              '${MainInfo().cwd?.path}/lib/input/assets/image-conversion-error.png')
          .readAsBytesSync();
      var file =
          File('${MainInfo().outputPath}pngs/${UUID}.png'.replaceAll(':', '_'))
            ..createSync(recursive: true);
      file.writeAsBytesSync(img);
      return Future.value(InheritedBitmap(
        this,
        name,
        currentContext: currentContext,
      ));
    } */
  }

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
  String type;
}
