import 'package:json_annotation/json_annotation.dart';

part 'pbdl_auto_layout_options.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLAutoLayoutOptions {
  Orientation? orientation;
  num? spacing;

  num? leftPadding;
  num? rightPadding;
  num? topPadding;
  num? bottomPadding;

  AxisAlignment? counterAxisAlignment;
  AxisAlignment? primaryAxisAlignment;

  AxisMode? counterAxisSizing;
  AxisMode? primaryAxisSizing;

  PBDLAutoLayoutOptions({
    this.orientation,
    this.spacing,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    this.counterAxisAlignment,
    this.primaryAxisAlignment,
    this.counterAxisSizing,
    this.primaryAxisSizing,
  });

  @override
  factory PBDLAutoLayoutOptions.fromJson(Map<String, dynamic> json) =>
      _$PBDLAutoLayoutOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PBDLAutoLayoutOptionsToJson(this);
}

enum Orientation { VERTICAL, HORIZONTAL }

enum AxisAlignment { START, CENTER, END, SPACE_BETWEEN }

enum AxisMode { FIXED, HUGGED }
