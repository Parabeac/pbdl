import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_global_styles.g.dart';

@JsonSerializable(explicitToJson: true)

/// Class that holds all global styles for the project.
class PBDLGlobalStyles extends PBDLNode {
  PBDLGlobalStyles({
    this.colors,
    this.textStyles,
  }) : super('', '', false, null, null, null);

  @override
  final String pbdlType = 'global_styles';

  @JsonKey(defaultValue: [])
  final List<PBDLGlobalColor> colors;

  @JsonKey(defaultValue: [])
  final List<PBDLGlobalTextStyle> textStyles;

  factory PBDLGlobalStyles.fromJson(Map<String, dynamic> json) =>
      _$PBDLGlobalStylesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLGlobalStylesToJson(this);
}
