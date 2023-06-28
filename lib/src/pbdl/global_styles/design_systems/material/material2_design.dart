import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_color_scheme.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material_color_scheme.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_nodes_export.dart';

part 'material2_design.g.dart';

@JsonSerializable(explicitToJson: true)
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
      total += scheme.supportedAttributes!.length;
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

  @override
  Map<String, dynamic> toJson() {
    return _$MaterialDesign2ToJson(this);
  }

  factory MaterialDesign2.fromJson(Map<String, dynamic> json) {
    return _$MaterialDesign2FromJson(json);
  }
}
