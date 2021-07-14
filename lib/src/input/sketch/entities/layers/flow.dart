import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_flow.dart';

part 'flow.g.dart';

@JsonSerializable()
class Flow {
  @JsonKey(name: '_class')
  final String classField;
  String destinationArtboardID;
  bool maintainScrollPosition;
  dynamic animationType;
  Flow({
    this.classField,
    this.destinationArtboardID,
    this.maintainScrollPosition,
    this.animationType,
  });
  factory Flow.fromJson(Map<String, dynamic> json) => _$FlowFromJson(json);
  Map<String, dynamic> toJson() => _$FlowToJson(this);

  PBDLFlow interpretFlow() {
    return PBDLFlow(
      classField: classField,
      destinationArtboardID: destinationArtboardID,
      maintainScrollPosition: maintainScrollPosition,
      animationType: animationType,
    );
  }
}
