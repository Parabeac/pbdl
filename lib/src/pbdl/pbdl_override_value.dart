import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';

part 'pbdl_override_value.g.dart';

@JsonSerializable()
class PBDLOverrideValue extends PBDLNode implements PBDLNodeFactory {
  /// value of the override
  var value;

  @override
  final type;

  @override
  @JsonKey(ignore: true)
  bool isVisible;

  @override
  @JsonKey(ignore: true)
  PBDLFrame boundaryRectangle;

  @override
  @JsonKey(ignore: true)
  PBDLStyle style;

  @override
  @JsonKey(ignore: true)
  String prototypeNodeUUID;

  PBDLOverrideValue(
    String UUID,
    String name,
    this.type,
    this.value,
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
