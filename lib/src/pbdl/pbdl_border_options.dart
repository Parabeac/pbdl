import 'package:json_annotation/json_annotation.dart';

import '../../pbdl.dart';

part 'pbdl_border_options.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLBorderOptions {
  List<PBDLBorder>? borders;

  num? strokeWeight;

  String? strokeAlign;

  String? strokeJoin;

  List? strokeDashes;

  num? cornerRadius;

  final pbdlType = 'border_options';

  PBDLBorderOptions({
    this.borders,
    this.strokeWeight,
    this.strokeAlign,
    this.strokeJoin,
    this.strokeDashes,
    this.cornerRadius,
  });

  @override
  factory PBDLBorderOptions.fromJson(Map<String, dynamic> json) =>
      _$PBDLBorderOptionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLBorderOptionsToJson(this);
}
