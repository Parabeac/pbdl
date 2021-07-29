import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/sketch/entities/objects/override_value.dart';

part 'override_value.g.dart';

@JsonSerializable()

/// title: Override Property
/// description: Defines override properties on symbol masters
class FigmaOverridableValue {
  static final String CLASS_NAME = 'overrideValue';
  final String overrideName;
  @JsonKey(name: 'do_objectID')
  final String UUID;
  final dynamic value;

  FigmaOverridableValue(this.overrideName, this.UUID, this.value);

  factory FigmaOverridableValue.fromJson(Map<String, dynamic> json) =>
      _$FigmaOverridableValueFromJson(json);
  Map<String, dynamic> toJson() => _$FigmaOverridableValueToJson(this);

  OverridableValue interpretOverridableValue() {
    return OverridableValue(overrideName, UUID, value);
  }
}
