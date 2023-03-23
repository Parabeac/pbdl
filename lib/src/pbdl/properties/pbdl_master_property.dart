import 'package:pbdl/src/input/figma/helper/properties/utils/figma_instance_swap_preferred_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_master_property.g.dart';

@JsonSerializable(includeIfNull: false)
class MasterProperty {
  MasterProperty(
    this.type,
    this.value,
    this.preferredValues,
  );

  MasterPropertyType type;

  // Either String or Bool
  var value;

  List<InstanceSwapPreferredValue> preferredValues;

  static MasterPropertyType stringToMasterPropertyType(String value) =>
      _$enumDecodeNullable(_$MasterPropertyTypeEnumMap, value);

  factory MasterProperty.fromJson(Map<String, dynamic> json) =>
      _$MasterPropertyFromJson(json);

  Map toJson() => _$MasterPropertyToJson(this);
}

enum MasterPropertyType {
  BOOLEAN,
  TEXT,
  INSTANCE_SWAP,
  VARIANT,
}
