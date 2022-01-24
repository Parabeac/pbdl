import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

import '../../pbdl.dart';

part 'pbdl_fill.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFill extends PBDLNode {
  PBDLColor color;
  @JsonKey(defaultValue: true)
  bool isEnabled;
  //TODO: Fix constructor
  PBDLFill(this.color, [this.isEnabled = true])
      : super('', '', false, null, null, '');
  @override
  final pbdlType = 'fill';

  @override
  factory PBDLFill.fromJson(Map<String, dynamic> json) =>
      _$PBDLFillFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLFillToJson(this);
}
