import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'pbdl_boundary_box.g.dart';

@JsonSerializable()
class PBDLBoundaryBox {
  final bool? constrainProportions;
  PBDLConstraints? constraints;
  double? height, width, x, y, z;
  String? type = 'boundaryBox';

  PBDLBoundaryBox(
      {this.constrainProportions,
      this.x,
      this.y,
      this.z,
      this.width,
      this.height,
      this.constraints});

  Map<String, dynamic> toJson() => _$PBDLBoundaryBoxToJson(this);

  static PBDLBoundaryBox fromJson(Map<String, dynamic> json) =>
      _$PBDLBoundaryBoxFromJson(json);
}
