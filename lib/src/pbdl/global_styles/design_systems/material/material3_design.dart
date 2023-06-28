import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_color_scheme.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material_color_scheme.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_nodes_export.dart';

part 'material3_design.g.dart';

@JsonSerializable(explicitToJson: true)
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
      total += scheme.supportedAttributes!.length;
    }
    return total;
  }

  @override
  int get totalDesignCount => _textStyles.length + supportedAttributesCount;

  MaterialDesign3()
      : super(
          'material3',
          textStyles: _textStyles,
          colorSchemes: _colorSchemes,
        );

  @override
  Map<String, dynamic> toJson() {
    return _$MaterialDesign3ToJson(this);
  }

  factory MaterialDesign3.fromJson(Map<String, dynamic> json) {
    return _$MaterialDesign3FromJson(json);
  }
}
