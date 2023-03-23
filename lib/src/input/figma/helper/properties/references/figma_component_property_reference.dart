import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/properties/pbdl_master_property_reference.dart';

part 'figma_component_property_reference.g.dart';

@JsonSerializable()
class ComponentPropertyReference {
  ComponentPropertyReference(
    this.visible,
    this.characters,
    this.mainComponent,
  );

  String visible;
  String characters;
  String mainComponent;

  factory ComponentPropertyReference.fromJson(Map<String, dynamic> json) =>
      _$ComponentPropertyReferenceFromJson(json);

  Map toJson() => _$ComponentPropertyReferenceToJson(this);

  MasterPropertyReference toPBDL() =>
      MasterPropertyReference.fromJson(toJson());
}
