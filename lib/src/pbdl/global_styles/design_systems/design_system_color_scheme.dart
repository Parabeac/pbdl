import 'package:pbdl/pbdl.dart';

abstract class DesignSystemColorScheme extends PBDLNode {
  Set<String> supportedAttributes;
  DesignSystemColorScheme(
    String name, {
    this.supportedAttributes,
  }) : super('', name, false, null, null, '');

  /// Returns [true] if [color] is part of [this] ColorScheme's attributes.
  bool isSupportedColor(String color);
}
