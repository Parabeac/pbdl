import 'package:json_annotation/json_annotation.dart';

part 'figma_instance_swap_preferred_value.g.dart';

@JsonSerializable()
class InstanceSwapPreferredValue {
  InstanceSwapPreferredValue(
    this.type,
    this.key,
  );

  InstanceSwapPreferredValueType type;
  String key;

  factory InstanceSwapPreferredValue.fromJson(Map<String, dynamic> json) =>
      _$InstanceSwapPreferredValueFromJson(json);

  Map toJson() => _$InstanceSwapPreferredValueToJson(this);
}

enum InstanceSwapPreferredValueType {
  COMPONENT,
  COMPONENT_SET,
}
