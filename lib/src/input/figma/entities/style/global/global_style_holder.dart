import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/global/fill_style_global.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_styles.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

/// Class that holds the global style properties of a Figma node.
class GlobalStyleHolder extends FigmaBaseNode {
  final _properties = <String, GlobalStyleProperty>{};

  /// Adds the [GlobalStyleProperty] to the correct list.
  void add(GlobalStyleProperty property) {
    _properties[property.UUID] = property;
  }

  Iterable<FillStyleGlobal> get fills =>
      _properties.values.whereType<FillStyleGlobal>();

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
    var interpretedFills = <PBDLNode>[];
    for (var fill in fills) {
      interpretedFills.add(await fill.interpretNode());
    }
    return PBDLGlobalStyles(
      colors: interpretedFills,
    );
  }
}
