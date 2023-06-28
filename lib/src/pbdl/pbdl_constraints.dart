import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';

part 'pbdl_constraints.g.dart';

/// Named PBDL in anticipation of the refactor where PBDL becomes the design standard.
/// Each property must be set, potentially use https://pub.dev/packages/meta to make these named parameters required.
@JsonSerializable()
class PBDLConstraints {
  /// - If all the pins are `false` thats just means is going to scale normally.
  /// - If there is a pin value that is `true` we are going to use the constant value for that
  /// attribute instead of the scaling value(using media query).
  bool? pinLeft;
  bool? pinRight;
  bool? pinTop;
  bool? pinBottom;
  bool? fixedHeight;
  bool? fixedWidth;
  PBDLConstraints(
      {this.pinLeft,
      this.pinRight,
      this.pinTop,
      this.pinBottom,
      this.fixedHeight,
      this.fixedWidth});

  factory PBDLConstraints.defaultConstraints() => PBDLConstraints(
      pinLeft: false,
      pinBottom: false,
      pinRight: false,
      pinTop: false,
      fixedHeight: false,
      fixedWidth: false);
  factory PBDLConstraints.fromJson(Map<String, dynamic> json) =>
      _$PBDLConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLConstraintsToJson(this);
}
