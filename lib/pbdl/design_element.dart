import 'package:pbdl/pbdl/pbdl_node.dart';
import 'package:json_annotation/json_annotation.dart';

part 'design_element.g.dart';

@JsonSerializable()
class DesignElement extends PBDLNode {
  DesignElement({
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

  factory DesignElement.fromJson(Map<String, dynamic> json) =>
      _$DesignElementFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DesignElementToJson(this);
}
