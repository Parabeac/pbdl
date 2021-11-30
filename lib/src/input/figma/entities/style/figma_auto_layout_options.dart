import 'package:json_annotation/json_annotation.dart';

part 'figma_auto_layout_options.g.dart';

@JsonSerializable()
class FigmaAutoLayoutOptions {
  String layoutMode;
  num itemSpacing;

  num paddingLeft;
  num paddingRight;
  num paddingTop;
  num paddingBottom;

  String primaryAxisSizingMode;
  String counterAxisSizingMode;

  String primaryAxisAlignItems;
  String counterAxisAlignItems;

  FigmaAutoLayoutOptions({
    this.layoutMode,
    this.itemSpacing,
    this.paddingLeft,
    this.paddingRight,
    this.paddingTop,
    this.paddingBottom,
    this.primaryAxisSizingMode,
    this.counterAxisSizingMode,
    this.primaryAxisAlignItems,
    this.counterAxisAlignItems,
  });

  Map<String, dynamic> toJson() => _$FigmaAutoLayoutOptionsToJson(this);

  factory FigmaAutoLayoutOptions.fromJson(Map<String, dynamic> json) =>
      _$FigmaAutoLayoutOptionsFromJson(json);
}
