import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/input/figma/entities/style/global/fill_style_global.dart';
import 'package:pbdl/src/input/figma/entities/style/global/global_style_property.dart';
import 'package:pbdl/src/input/figma/entities/style/global/text_style_global.dart';
import 'package:pbdl/src/pbdl/global_styles/design_systems/design_system_theme_data.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_color.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_styles.dart';
import 'package:pbdl/src/pbdl/global_styles/pbdl_global_text_style.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';

part 'global_style_holder.g.dart';

/// Class that holds the global style properties of a Figma node.
@JsonSerializable()
class GlobalStyleHolder extends FigmaBaseNode {
  GlobalStyleHolder([this.designSystemThemeData]);

  /// Registered [GlobalStyleProperty]s.
  final _properties = <String?, GlobalStyleProperty>{};

  final registeredPropertyNames = <String>[
    'fill',
    'text',
  ];

  static var _styleNameCounter = Map<String, int>();

  @JsonKey(ignore: true)
  final DesignSystemThemeData? designSystemThemeData;

  /// Adds the [GlobalStyleProperty] to the correct list.
  void add(GlobalStyleProperty property) {
    property.name = _checkAndReturnValueName(property.name!);
    _properties[property.UUID] = property;
  }

  Iterable<FillStyleGlobal> get fills =>
      _properties.values.whereType<FillStyleGlobal>();

  Iterable<TextStyleGlobal> get textStyles =>
      _properties.values.whereType<TextStyleGlobal>();

  /// Returns the [GlobalStyleProperty] with the given [UUID] and specified type [T].
  ///
  /// If the [UUID] is not found, returns null.
  /// If the [UUID] is found, but the type [T] does not match, returns null.
  T? getProperty<T extends GlobalStyleProperty?>(String UUID) {
    if (_properties.containsKey(UUID) && _properties[UUID] is T) {
      return _properties[UUID] as T?;
    }
    return null;
  }

  String _checkAndReturnValueName(String valueName) {
    var name = valueName.toLowerCase();
    if (_styleNameCounter.containsKey(name)) {
      _styleNameCounter[name] = _styleNameCounter[name]! + 1;
      return valueName + _styleNameCounter[name].toString();
    } else {
      _styleNameCounter[name] = 1;
      return valueName;
    }
  }

  @override
  Future<PBDLNode> interpretNode() async {
    /// Interpret fills to [PBDLGlobalFillProperty]
    var themeColors = <PBDLGlobalColor>[];
    var globalColors = <PBDLGlobalColor>[];
    var themeTextStyles = <PBDLGlobalTextStyle>[];
    var globalTextStyles = <PBDLGlobalTextStyle>[];

    for (var fill in fills) {
      final interpretedFill = await fill.interpretNode();
      if (interpretedFill == null) {
        continue;
      }
      final colorScheme = designSystemThemeData!.colorScheme(fill.name);
      if (colorScheme != null) {
        (interpretedFill as PBDLGlobalColor).colorScheme = colorScheme.name;
        themeColors.add(interpretedFill);
      } else {
        globalColors.add(interpretedFill as PBDLGlobalColor);
      }
    }

    /// Interpret text styles to [PBDLGlobalTextStyle]
    for (var textStyle in textStyles) {
      final interpretedTextStyle = await textStyle.interpretNode();
      if (interpretedTextStyle == null) {
        continue;
      }
      if (designSystemThemeData!.isTextStyle(interpretedTextStyle.name)) {
        themeTextStyles.add(interpretedTextStyle as PBDLGlobalTextStyle);
      } else {
        globalTextStyles.add(interpretedTextStyle as PBDLGlobalTextStyle);
      }
    }

    return PBDLGlobalStyles(
      colors: globalColors,
      textStyles: globalTextStyles,
      themeColors: themeColors,
      themeTextStyles: themeTextStyles,
      designSystem: designSystemThemeData!.name,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$GlobalStyleHolderToJson(this);

  factory GlobalStyleHolder.fromJson(Map<String, dynamic> json) =>
      _$GlobalStyleHolderFromJson(json);
}
