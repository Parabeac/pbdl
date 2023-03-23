import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property.dart';

part 'pbdl_master_property_definition.g.dart';

@JsonSerializable(includeIfNull: false)
class MasterPropertyDefinition extends MasterProperty {
  MasterPropertyDefinition(
    MasterPropertyType type,
    value,
    preferredValues,
    this.propertyName,
    this.defaultValue,
    this.variantOptions,
  ) : super(type, value, preferredValues);

  String propertyName;

  var defaultValue;

  List<String> variantOptions;

  factory MasterPropertyDefinition.fromJson(Map<String, dynamic> json) =>
      _$MasterPropertyDefinitionFromJson(json);
}

@JsonSerializable()
class SharedInstanceSwapPreferredValue {
  SharedInstanceSwapPreferredValue(
    this.type,
    this.key,
  );

  InstanceSwapPreferredValueType type;
  String key;

  factory SharedInstanceSwapPreferredValue.fromJson(
          Map<String, dynamic> json) =>
      _$SharedInstanceSwapPreferredValueFromJson(json);

  Map toJson() => _$SharedInstanceSwapPreferredValueToJson(this);
}

enum InstanceSwapPreferredValueType {
  COMPONENT,
  COMPONENT_SET,
}
