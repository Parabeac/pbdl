import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material_color_scheme.dart';

class MaterialDesign3 extends DesignSystemThemeData {
  static const _textStyles = [
    'bodyLarge',
    'bodyMedium',
    'bodySmall',
    'displayLarge',
    'displayMedium',
    'displaySmall',
    'headlineLarge',
    'headlineMedium',
    'headlineSmall',
    'labelLarge',
    'labelMedium',
    'labelSmall',
    'titleLarge',
    'titleMedium',
    'titleSmall',
  ];

  static final _colorSchemes = [
    MaterialColorScheme('light'),
    MaterialColorScheme('dark'),
  ];

  int get supportedAttributesCount {
    var total = 0;
    for (var scheme in _colorSchemes) {
      total += scheme.supportedAttributes.length;
    }
    return total;
  }

  int get totalMaterialCount => _textStyles.length + supportedAttributesCount;

  MaterialDesign3()
      : super(
          'material3',
          textStyles: _textStyles,
          colorSchemes: _colorSchemes,
        );
}
