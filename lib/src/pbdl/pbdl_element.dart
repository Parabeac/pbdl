import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_reference.dart';

part 'pbdl_element.g.dart';

@JsonSerializable(explicitToJson: true)
// TODO: Not sure why this class exists.
class PBDLElement extends PBDLNode {
  @override
  final pbdlType = 'element';
  PBDLElement({
    UUID,
    name,
    isVisible,
    boundaryRectangle,
    type,
    PBDLStyle style,
    prototypeNodeUUID,
    PBDLConstraints constraints,
    layoutMainAxisSizing,
    layoutCrossAxisSizing,
    MasterPropertyReference masterPropertyReferences,
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
          masterPropertyReferences: masterPropertyReferences,
        );

  factory PBDLElement.fromJson(Map<String, dynamic> json) =>
      _$PBDLElementFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLElementToJson(this);
}
