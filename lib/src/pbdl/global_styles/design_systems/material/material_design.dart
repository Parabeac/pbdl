import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material_color_scheme.dart';

class MaterialDesign extends DesignSystemThemeData {
  static const _textStyles = [
    'bodyLarge',
    'bodyMedium',
    'bodySmall',
    'bodyText1',
    'bodyText2',
    'button',
    'caption',
    'displayLarge',
    'displayMedium',
    'displaySmall',
    'headline1',
    'headline2',
    'headline3',
    'headline4',
    'headline5',
    'headline6',
    'headlineLarge',
    'headlineMedium',
    'headlineSmall',
    'labelLarge',
    'labelMedium',
    'labelSmall',
    'overline',
    'subtitle1',
    'subtitle2',
    'titleLarge',
    'titleMedium',
    'titleSmall',
  ];

  static final _colorSchemes = [
    MaterialColorScheme('light'),
    MaterialColorScheme('dark'),
  ];

  MaterialDesign()
      : super(
          'material',
          textStyles: _textStyles,
          colorSchemes: _colorSchemes,
        );
}
