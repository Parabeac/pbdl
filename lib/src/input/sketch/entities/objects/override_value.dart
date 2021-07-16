import 'package:json_annotation/json_annotation.dart';

import 'sketch_override.dart';

part 'override_value.g.dart';

@JsonSerializable()

/// title: Override Property
/// description: Defines override properties on symbol masters
class OverridableValue extends SketchOverride {
  static final String CLASS_NAME = 'overrideValue';
  @override
  final String overrideName;
  @JsonKey(name: 'do_objectID')
  final String UUID;
  final dynamic value;

  OverridableValue(this.overrideName, this.UUID, this.value);

  factory OverridableValue.fromJson(Map<String, dynamic> json) =>
      _$OverridableValueFromJson(json);
  Map<String, dynamic> toJson() => _$OverridableValueToJson(this);
}
