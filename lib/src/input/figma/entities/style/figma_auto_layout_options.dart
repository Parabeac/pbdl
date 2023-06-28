import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_auto_layout_options.dart';

part 'figma_auto_layout_options.g.dart';

@JsonSerializable()
class FigmaAutoLayoutOptions {
  String? layoutMode;
  num? itemSpacing;

  num? paddingLeft;
  num? paddingRight;
  num? paddingTop;
  num? paddingBottom;

  String? primaryAxisSizingMode;
  String? counterAxisSizingMode;

  String? primaryAxisAlignItems;
  String? counterAxisAlignItems;

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

  PBDLAutoLayoutOptions interpretOptions() {
    var orientation = layoutMode == 'HORIZONTAL'
        ? Orientation.HORIZONTAL
        : Orientation.VERTICAL;

    var primaryAxisSizing = _getAxisSizing(primaryAxisSizingMode);
    var counterAxisSizing = _getAxisSizing(counterAxisSizingMode);

    var primaryAlignment = _getAlignment(primaryAxisAlignItems);
    var counterAlignment = _getAlignment(counterAxisAlignItems);

    return PBDLAutoLayoutOptions(
      orientation: orientation,
      spacing: itemSpacing,
      leftPadding: paddingLeft,
      rightPadding: paddingRight,
      topPadding: paddingTop,
      bottomPadding: paddingBottom,
      primaryAxisSizing: primaryAxisSizing,
      counterAxisSizing: counterAxisSizing,
      primaryAxisAlignment: primaryAlignment,
      counterAxisAlignment: counterAlignment,
    );
  }

  AxisAlignment _getAlignment(String? axisAlignment) {
    switch (axisAlignment) {
      case 'CENTER':
        return AxisAlignment.CENTER;
      case 'MAX':
        return AxisAlignment.END;
      case 'SPACE_BETWEEN':
        return AxisAlignment.SPACE_BETWEEN;
      default:
        return AxisAlignment.START;
    }
  }

  AxisMode _getAxisSizing(String? sizingMode) {
    switch (sizingMode) {
      case 'FIXED':
        return AxisMode.FIXED;
      default:
        return AxisMode.HUGGED;
    }
  }

  Map<String, dynamic> toJson() => _$FigmaAutoLayoutOptionsToJson(this);

  factory FigmaAutoLayoutOptions.fromJson(Map<String, dynamic> json) =>
      _$FigmaAutoLayoutOptionsFromJson(json);
}
