import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_color_scheme.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material2_design.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material3_design.dart';

abstract class DesignSystemThemeData extends PBDLNode {
  DesignSystemThemeData(
    String name, {
    this.textStyles,
    this.colorSchemes,
  }) : super('', name, false, null, null, '');

  List<String> textStyles;

  List<DesignSystemColorScheme> colorSchemes;

  int get totalMaterialCount;

  /// Returns [true] if [style] is part of the [DesignSystemThemeData's] [TextStyles]
  bool isTextStyle(String style) => textStyles.contains(style);

  /// Returns [true] if [color] is part of the [DesignSystemThemeData's] [ColorSchemes]
  DesignSystemColorScheme colorScheme(String color) => colorSchemes.firstWhere(
        (element) => element.isSupportedColor(color),
        orElse: () => null,
      );

  static DesignSystemThemeData getDesignSystem(String designSystem) {
    switch (designSystem) {
      case 'material3':
        return MaterialDesign3();
      case 'material2':
      default:
        return MaterialDesign2();
    }
  }
}
