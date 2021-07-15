import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

@JsonSerializable()
class PBDLOverrideValue extends PBDLNode implements PBDLNodeFactory {
  /// value of the override
  var value;

  PBDLOverrideValue(
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

  factory PBDLOverrideValue.fromJson(Map<String, dynamic> json) =>
      _$PBDLOverridePropertyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLOverrideValueToJson(this);
}
