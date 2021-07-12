// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLText _$TextFromJson(Map<String, dynamic> json) {
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
    ..content = json['content'] as String;
}

Map<String, dynamic> _$TextToJson(PBDLText instance) => <String, dynamic>{
      'UUID': instance.UUID,
      'name': instance.name,
      'isVisible': instance.isVisible,
      'boundaryRectangle': instance.boundaryRectangle,
      'type': instance.type,
      'style': instance.style,
      'prototypeNodeUUID': instance.prototypeNodeUUID,
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
