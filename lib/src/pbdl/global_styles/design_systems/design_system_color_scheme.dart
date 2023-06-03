import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/material/material_color_scheme.dart';

part 'design_system_color_scheme.g.dart';

@JsonSerializable(createFactory: false)
abstract class DesignSystemColorScheme extends PBDLNode {
  Set<String> supportedAttributes;
  DesignSystemColorScheme(
    String name, {
    required this.supportedAttributes,
  }) : super(
          '',
          name,
          false,
          null,
          null,
          '',
          pbdlType: 'design_system_color_scheme',
        );

  /// Returns [true] if [color] is part of [this] ColorScheme's attributes.
  bool isSupportedColor(String color);

  factory DesignSystemColorScheme.fromJson(Map<String, dynamic> json) {
    // TODO: Add attribute to [DesignSystemColorScheme] to support more than material.
    // Currently assuming all colorschemes are material
    return MaterialColorScheme.fromJson(json);
  }
}
