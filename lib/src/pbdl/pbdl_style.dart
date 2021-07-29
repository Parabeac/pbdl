import 'package:pbdl/src/pbdl/pbdl_border.dart';
import 'package:pbdl/src/pbdl/pbdl_border_options.dart';
import 'package:pbdl/src/pbdl/pbdl_fill.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:pbdl/src/pbdl/pbdl_text_style.dart';
import 'pbdl_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_style.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLStyle extends PBDLNode {
  PBDLColor backgroundColor;
  List<PBDLFill> fills;
  List<PBDLBorder> borders;
  PBDLBorderOptions borderOptions;
  PBDLTextStyle textStyle;
  bool hasShadow = false;

  @override
  @JsonKey(ignore: true)
  PBDLStyle style;

  @override
  @JsonKey(ignore: true)
  String UUID;

  @override
  @JsonKey(ignore: true)
  String name;

  @override
  @JsonKey(ignore: true)
  PBDLFrame boundaryRectangle;

  @override
  @JsonKey(ignore: true)
  String prototypeNodeUUID;

  @override
  @JsonKey(ignore: true)
  var child;

  @override
  final type = 'style';

  PBDLStyle({
    this.fills,
    this.backgroundColor,
    this.borders,
    this.borderOptions,
    this.textStyle,
    this.hasShadow,
  }) : super('', '', true, null, null, '');

  @override
  factory PBDLStyle.fromJson(Map<String, dynamic> json) =>
      _$PBDLStyleFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLStyleToJson(this);
}
