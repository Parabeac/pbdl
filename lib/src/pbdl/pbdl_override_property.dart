import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

part 'pbdl_override_property.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLOverrideProperty extends PBDLNode implements PBDLNodeFactory {
  /// Value of the override property
  PBDLNode value;

  @override
  final pbdlType = 'pbdl_override_property';

  @override
  @JsonKey(ignore: true)
  bool isVisible;

  @override
  @JsonKey(ignore: true)
  PBDLBoundaryBox boundaryRectangle;

  @override
  @JsonKey(ignore: true)
  PBDLStyle style;

  @override
  @JsonKey(ignore: true)
  String prototypeNodeUUID;

  /// Type of the override property
  final ovrType;

  PBDLOverrideProperty(
    String UUID,
    String name,
    this.ovrType,
    this.value,
  ) : super(
          UUID,
          name,
          true,
          null,
          null,
          null,
        ) {
    if (!name.startsWith('ovr')) {
      this.name = 'ovr' + name;
    }
  }

  factory PBDLOverrideProperty.fromJson(Map<String, dynamic> json) =>
      _$PBDLOverridePropertyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLOverridePropertyToJson(this);
}
