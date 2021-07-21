import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/sketch/entities/objects/sketch_override.dart';

part 'override_property.g.dart';

@JsonSerializable()

/// title: Override Property
/// description: Defines override properties on symbol masters
class OverridableProperty extends SketchOverride {
  static final String CLASS_NAME = 'MSImmutableOverrideProperty';
  @override
  final String overrideName;
  final bool canOverride;

  OverridableProperty(this.overrideName, this.canOverride);

  factory OverridableProperty.fromJson(Map<String, dynamic> json) =>
      _$OverridablePropertyFromJson(json);
  Map<String, dynamic> toJson() => _$OverridablePropertyToJson(this);
}
