import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material_color_scheme.dart';

class MaterialDesign2 extends DesignSystemThemeData {
  static const _textStyles = [
    'bodyText1',
    'bodyText2',
    'button',
    'caption',
    'headline1',
    'headline2',
    'headline3',
    'headline4',
    'headline5',
    'headline6',
    'overline',
    'subtitle1',
    'subtitle2',
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

  @override
  int get totalDesignCount => _textStyles.length + supportedAttributesCount;

  MaterialDesign2()
      : super(
          'material2',
          textStyles: _textStyles,
          colorSchemes: _colorSchemes,
        );
}
