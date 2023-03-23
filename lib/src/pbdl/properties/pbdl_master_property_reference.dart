import 'package:json_annotation/json_annotation.dart';

part 'pbdl_master_property_reference.g.dart';

@JsonSerializable(includeIfNull: false)
class MasterPropertyReference {
  MasterPropertyReference(
    this.visible,
    this.characters,
    this.mainComponent,
  );

  String visible;
  String characters;
  String mainComponent;

  factory MasterPropertyReference.fromJson(Map<String, dynamic> json) =>
      _$MasterPropertyReferenceFromJson(json);

  Map toJson() => _$MasterPropertyReferenceToJson(this);
}
