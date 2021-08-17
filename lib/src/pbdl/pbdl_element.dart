import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_element.g.dart';

@JsonSerializable(explicitToJson: true)
// TODO: Not sure why this class exists.
class PBDLElement extends PBDLNode {
  @override
  final type = 'element';
  PBDLElement({
    UUID,
    name,
    isVisible,
    boundaryRectangle,
    type,
    style,
    prototypeNodeUUID,
    PBDLConstraints constraints
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          style,
          prototypeNodeUUID,
          constraints: constraints
        );

  factory PBDLElement.fromJson(Map<String, dynamic> json) =>
      _$PBDLElementFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLElementToJson(this);
}
