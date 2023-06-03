import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';

@JsonSerializable(explicitToJson: true)

/// Abstract class that represents a global style node of the project.
abstract class PBDLGlobalStyle extends PBDLNode {
  @JsonKey(defaultValue: '')
  String description;
  PBDLGlobalStyle(
    String UUID,
    String name, {
    this.description = '',
    required String pbdlType,
  }) : super(
          UUID,
          name,
          false,
          null,
          null,
          null,
          pbdlType: pbdlType,
        );
}
