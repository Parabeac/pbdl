import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_global_color.g.dart';

@JsonSerializable(explicitToJson: true)

/// Class that represents a global color for the entire project.
///
/// Essentially, it is a wrapper for [PBDLColor] that adds a name and a description
class PBDLGlobalColor extends PBDLNode {
  PBDLGlobalColor(
    String UUID,
    String name,
    this.color, {
    String description = '',
  }) : super(UUID, name, false, null, null, null);

  @override
  final String pbdlType = 'global_color';

  /// Contains the actual color value.
  PBDLColor color;

  /// User-defined description of the color
  String description;

  factory PBDLGlobalColor.fromJson(Map<String, dynamic> json) => _$PBDLGlobalColorFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLGlobalColorToJson(this);
}
