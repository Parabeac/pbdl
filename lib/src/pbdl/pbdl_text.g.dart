// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLText _$PBDLTextFromJson(Map<String, dynamic> json) {
  return PBDLText(
    UUID: json['UUID'],
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLFrame.fromJson(json['boundaryRectangle'] as Map<String, dynamic>),
    isVisible: json['isVisible'] as bool,
    name: json['name'],
    attributedString: json['attributedString'],
    automaticallyDrawOnUnderlyingPath:
        json['automaticallyDrawOnUnderlyingPath'],
    dontSynchroniseWithSymbol: json['dontSynchroniseWithSymbol'],
    lineSpacingBehaviour: json['lineSpacingBehaviour'],
    textBehaviour: json['textBehaviour'],
    glyphBounds: json['glyphBounds'],
    type: json['type'],
    pbdfType: json['pbdfType'],
    style: json['style'],
  )
    ..prototypeNodeUUID = json['prototypeNodeUUID'] as String
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..content = json['content'] as String;
}

Map<String, dynamic> _$PBDLTextToJson(PBDLText instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle?.toJson(),
      'type': instance.type,
      'style': instance.style?.toJson(),
      'prototypeNodeUUID': instance.prototypeNodeUUID,
      'child': instance.child?.toJson(),
      'attributedString': instance.attributedString,
      'automaticallyDrawOnUnderlyingPath':
          instance.automaticallyDrawOnUnderlyingPath,
      'dontSynchroniseWithSymbol': instance.dontSynchroniseWithSymbol,
      'lineSpacingBehaviour': instance.lineSpacingBehaviour,
      'textBehaviour': instance.textBehaviour,
      'glyphBounds': instance.glyphBounds,
      'content': instance.content,
      'pbdfType': instance.pbdfType,
    };
