import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_style.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_global_color.g.dart';

@JsonSerializable(explicitToJson: true)

/// Class that represents a global color for the entire project.
///
/// Essentially, it is a wrapper for [PBDLColor] that adds a name and a description
class PBDLGlobalColor extends PBDLGlobalStyle {
  PBDLGlobalColor(
    String UUID,
    String name,
    this.color, {
    String description = '',
  }) : super(UUID, name, description: description);

  @override
  final String pbdlType = 'global_color';

  /// Contains the actual color value.
  PBDLColor color;

  factory PBDLGlobalColor.fromJson(Map<String, dynamic> json) =>
      _$PBDLGlobalColorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLGlobalColorToJson(this);
}
