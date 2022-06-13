import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/global/fill_style_global.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/input/figma/entities/style/global/text_style_global.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_color.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_styles.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

/// Class that holds the global style properties of a Figma node.
class GlobalStyleHolder extends FigmaBaseNode {
  /// Registered [GlobalStyleProperty]s.
  final _properties = <String, GlobalStyleProperty>{};

  final registeredPropertyNames = <String>[
    'fill',
    'text',
  ];

  /// Adds the [GlobalStyleProperty] to the correct list.
  void add(GlobalStyleProperty property) {
    // Check if any properties contain the same name with different UUID.
    if (_properties.entries.any((prop) => prop.value.name == property.name)) {
      return;
    }
    _properties[property.UUID] = property;
  }

  Iterable<FillStyleGlobal> get fills =>
      _properties.values.whereType<FillStyleGlobal>();

  Iterable<TextStyleGlobal> get textStyles => _properties.values
      .whereType<TextStyleGlobal>()
      .where((style) => style.textStyle != null);

  /// Returns the [GlobalStyleProperty] with the given [UUID] and specified type [T].
  ///
  /// If the [UUID] is not found, returns null.
  /// If the [UUID] is found, but the type [T] does not match, returns null.
  T getProperty<T extends GlobalStyleProperty>(String UUID) {
    if (_properties.containsKey(UUID) && _properties[UUID] is T) {
      return _properties[UUID];
    }
    return null;
  }

  @override
  Future<PBDLNode> interpretNode() async {
    /// Interpret fills to [PBDLGlobalFillProperty]
    var interpretedFills = <PBDLGlobalColor>[];
    for (var fill in fills) {
      interpretedFills.add(await fill.interpretNode());
    }

    /// Interpret text styles to [PBDLGlobalTextStyle]
    var interpretedTextStyles = <PBDLGlobalTextStyle>[];
    for (var textStyle in textStyles) {
      interpretedTextStyles.add(await textStyle.interpretNode());
    }

    /// FIXME: Find out why some fills are returning null.
    /// Theory is that this might have to do with global styles coming from another file.
    final filteredFills =
        interpretedFills.where((fill) => fill != null).toList();
    final filteredTextStyles =
        interpretedTextStyles.where((textStyle) => textStyle != null).toList();

    return PBDLGlobalStyles(
      colors: filteredFills,
      textStyles: filteredTextStyles,
    );
  }
}
