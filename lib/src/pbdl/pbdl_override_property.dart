import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

part 'pbdl_override_value.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLOverrideProperty extends PBDLNode implements PBDLNodeFactory {
  /// Value of the override property
  var value;

  PBDLOverrideProperty(
    String UUID,
    String name,
    bool isVisible,
    boundaryRectangle,
    String type,
    PBDLStyle style,
    String prototypeNodeUUID,
    this.value,
  ) : super(
          UUID,
          name,
          isVisible,
          boundaryRectangle,
          type,
          style,
          prototypeNodeUUID,
        );

  factory PBDLOverrideProperty.fromJSON(Map<String, dynamic> json) =>
      _$PBDLOverridePropertyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLOverridePropertyToJSON(this);
}
