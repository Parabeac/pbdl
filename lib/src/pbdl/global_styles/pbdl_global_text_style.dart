import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_style.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_global_text_style.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLGlobalTextStyle extends PBDLGlobalStyle {
  PBDLGlobalTextStyle(
    String UUID,
    String? name,
    this.textStyle, {
    String? description = '',
  }) : super(UUID, name, description: description);

  @override
  String? pbdlType = 'global_text_style';

  /// Contains the actual text style value.
  PBDLTextStyle? textStyle;

  factory PBDLGlobalTextStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLGlobalTextStyleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLGlobalTextStyleToJson(this);
}
