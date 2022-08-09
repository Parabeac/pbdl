import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_color_scheme.dart';

abstract class DesignSystemThemeData extends PBDLNode {
  DesignSystemThemeData(
    String name, {
    this.textStyles,
    this.colorSchemes,
  }) : super('', name, false, null, null, '');

  List<String> textStyles;

  List<DesignSystemColorScheme> colorSchemes;

  /// Returns [true] if [style] is part of the [DesignSystemThemeData's] [TextStyles]
  bool isTextStyle(String style) => textStyles.contains(style);

  /// Returns [true] if [color] is part of the [DesignSystemThemeData's] [ColorSchemes]
  bool isColorScheme(String color) =>
      colorSchemes.any((element) => element.isSupportedColor(color));
}
