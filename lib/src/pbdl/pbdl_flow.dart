import 'package:json_annotation/json_annotation.dart';

part 'pbdl_flow.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLFlow {
  String? nodeID;
  String? type = 'flow';

  final String? classField;
  String? destinationArtboardID;
  bool? maintainScrollPosition;
  dynamic animationType;
  PBDLFlow({
    this.classField,
    this.destinationArtboardID,
    this.maintainScrollPosition,
    this.animationType,
  });
  factory PBDLFlow.fromJson(Map<String, dynamic> json) =>
      _$PBDLFlowFromJson(json);
  Map<String, dynamic> toJson() => _$PBDLFlowToJson(this);
}
