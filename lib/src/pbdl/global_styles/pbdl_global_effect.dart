import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_effect.dart';

part 'pbdl_global_effect.g.dart';

@JsonSerializable(explicitToJson: true)

/// Class that represents a global effect for the entire project.
///
/// Essentially, it is a wrapper for [PBDLEffect] that adds a name and a description
class PBDLGlobalEffect extends PBDLGlobalStyle {
  PBDLGlobalEffect(
    String UUID,
    String name,
    this.effect, {
    String description = '',
  }) : super(UUID, name, description: description);

  @override
  final String pbdlType = 'global_effect';

  /// Contains the actual effect object.
  PBDLEffect effect;

  factory PBDLGlobalEffect.fromJson(Map<String, dynamic> json) =>
      _$PBDLGlobalEffectFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLGlobalEffectToJson(this);
}
