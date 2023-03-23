import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_reference.dart';

part 'pbdl_override_value.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLOverrideValue extends PBDLNode implements PBDLNodeFactory {
  /// value of the override
  PBDLNode value;

  String valueName;

  @override
  final pbdlType = 'pbdl_override_value';

  /// Type of the override value
  final ovrType;

  PBDLOverrideValue(
    String UUID,
    String name,
    this.ovrType,
    this.value,
    this.valueName,
  ) : super(
          UUID,
          name,
          true,
          null,
          null,
          null,
        );

  factory PBDLOverrideValue.fromJson(Map<String, dynamic> json) =>
      _$PBDLOverrideValueFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLOverrideValueToJson(this);
}
