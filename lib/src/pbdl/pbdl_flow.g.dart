// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_flow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLFlow _$PBDLFlowFromJson(Map<String, dynamic> json) => PBDLFlow(
      classField: json['classField'] as String?,
      destinationArtboardID: json['destinationArtboardID'] as String?,
      maintainScrollPosition: json['maintainScrollPosition'] as bool?,
      animationType: json['animationType'],
    )
      ..nodeID = json['nodeID'] as String?
      ..type = json['type'] as String?;

Map<String, dynamic> _$PBDLFlowToJson(PBDLFlow instance) => <String, dynamic>{
      'nodeID': instance.nodeID,
      'type': instance.type,
      'classField': instance.classField,
      'destinationArtboardID': instance.destinationArtboardID,
      'maintainScrollPosition': instance.maintainScrollPosition,
      'animationType': instance.animationType,
    };
