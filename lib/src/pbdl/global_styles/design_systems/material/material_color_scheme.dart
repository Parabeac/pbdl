import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_color_scheme.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_nodes_export.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_reference.dart';

part 'material_color_scheme.g.dart';

@JsonSerializable(explicitToJson: true)
class MaterialColorScheme extends DesignSystemColorScheme {
  /// List of attributes that every [ColorScheme] supports.
  static const Set<String> _baseSupportedAttributes = {
    'primary',
    'onPrimary',
    'primaryContainer',
    'onPrimaryContainer',
    'secondary',
    'onSecondary',
    'secondaryContainer',
    'onSecondaryContainer',
    'tertiary',
    'onTertiary',
    'tertiaryContainer',
    'onTertiaryContainer',
    'error',
    'onError',
    'errorContainer',
    'onErrorContainer',
    'background',
    'onBackground',
    'surface',
    'onSurface',
    'surfaceVariant',
    'onSurfaceVariant',
    'outline',
    'shadow',
    'inverseSurface',
    'onInverseSurface',
    'inversePrimary',
    'surfaceTint',
  };

  MaterialColorScheme(
    String name,
  ) : super(
          name,
          supportedAttributes: _baseSupportedAttributes,
        );

  @override
  bool isSupportedColor(String color) {
    final tokenizedColor = color.split('/');

    /// Check whether the color is in the format of `<color-scheme>/<color>`.
    if (tokenizedColor.length >= 2) {
      // Get last two elements from the tokenized color.
      final colorScheme = tokenizedColor[tokenizedColor.length - 2];
      final color = tokenizedColor.last;

      return colorScheme == name && _baseSupportedAttributes.contains(color);
    }

    return false;
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MaterialColorSchemeToJson(this);
  }

  factory MaterialColorScheme.fromJson(Map<String, dynamic> json) {
    return _$MaterialColorSchemeFromJson(json);
  }
}
