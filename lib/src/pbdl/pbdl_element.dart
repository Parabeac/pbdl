import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_element.g.dart';

@JsonSerializable(explicitToJson: true)
// TODO: Not sure why this class exists.
class PBDLElement extends PBDLNode {
  PBDLElement({
    UUID,
    name,
    isVisible,
    boundaryRectangle,
    type,
    style,
    prototypeNodeUUID,
  }) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          type,
          style,
          prototypeNodeUUID,
        );

  factory PBDLElement.fromJson(Map<String, dynamic> json) =>
      _$PBDLElementFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLElementToJson(this);
}
