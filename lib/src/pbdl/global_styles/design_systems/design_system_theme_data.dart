import 'package:collection/collection.dart' show IterableExtension;
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_color_scheme.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material2_design.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material3_design.dart';

part 'design_system_theme_data.g.dart';

@JsonSerializable(createFactory: false)
abstract class DesignSystemThemeData extends PBDLNode {
  DesignSystemThemeData(
    String name, {
    this.textStyles,
    this.colorSchemes,
  }) : super('', name, false, null, null, '');

  List<String>? textStyles;

  List<DesignSystemColorScheme>? colorSchemes;

  int get totalDesignCount;

  /// Returns [true] if [style] is part of the [DesignSystemThemeData's] [TextStyles]
  bool isTextStyle(String? style) => textStyles!.contains(style);

  /// Returns [true] if [color] is part of the [DesignSystemThemeData's] [ColorSchemes]
  DesignSystemColorScheme? colorScheme(String? color) => colorSchemes!.firstWhereOrNull(
        (element) => element.isSupportedColor(color),
      );

  static DesignSystemThemeData getDesignSystem(String designSystem) {
    switch (designSystem) {
      case 'material2':
        return MaterialDesign2();
      case 'material3':
      default:
        return MaterialDesign3();
    }
  }

  factory DesignSystemThemeData.fromJson(Map<String, dynamic> json) {
    switch (json['name']) {
      case 'material2':
        return MaterialDesign2.fromJson(json);
      case 'material3':
      default:
        return MaterialDesign3.fromJson(json);
    }
  }
}
