import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_global_image.g.dart';

@JsonSerializable(explicitToJson: true)

/// Class that represents a global color for the entire project.
///
/// Essentially, it is a wrapper for [PBDLColor] that adds a name and a description
class PBDLGlobalImage extends PBDLGlobalStyle {
  PBDLGlobalImage(
    String UUID,
    String name,
    this.image, {
    String description = '',
  }) : super(UUID, name, description: description);

  @override
  final String pbdlType = 'global_image';

  /// Contains the actual image value.
  PBDLFill image;

  /// If [this] is part of a theme [ColorScheme],
  /// the value will be contained within this [String].
  ///
  /// For example, if [this] is part of [ColorScheme.light], the value
  /// of [colorScheme] would be `light`
  @JsonKey(includeIfNull: false)
  String colorScheme;

  factory PBDLGlobalImage.fromJson(Map<String, dynamic> json) =>
      _$PBDLGlobalImageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLGlobalImageToJson(this);
}
