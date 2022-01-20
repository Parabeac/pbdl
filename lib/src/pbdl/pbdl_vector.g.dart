// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_vector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLVector _$PBDLVectorFromJson(Map<String, dynamic> json) {
  return PBDLVector(
    name: json['name'] as String,
    layoutAlign: json['layoutAlign'],
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    size: json['size'],
    strokes: json['strokes'],
    strokeWeight: json['strokeWeight'],
    strokeAlign: json['strokeAlign'],
    styles: json['styles'],
    fillsList: json['fillsList'],
    UUID: json['UUID'] as String,
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    prototypeNodeUUID: json['prototypeNodeUUID'],
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
  )
    ..isVisible = json['isVisible'] as bool
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..type = json['type'] as String
    ..imageReference = json['imageReference'] as String
    ..image = json['image'];
}

Map<String, dynamic> _$PBDLVectorToJson(PBDLVector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UUID', instance.UUID);
  writeNotNull('layoutMainAxisSizing',
      _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing]);
  writeNotNull('layoutCrossAxisSizing',
      _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing]);
  writeNotNull('name', instance.name);
  writeNotNull('isVisible', instance.isVisible);
  writeNotNull('boundaryRectangle', instance.boundaryRectangle?.toJson());
  writeNotNull('style', instance.style?.toJson());
  writeNotNull('prototypeNodeUUID', instance.prototypeNodeUUID);
  writeNotNull('child', instance.child?.toJson());
  writeNotNull('constraints', instance.constraints?.toJson());
  val['layoutAlign'] = instance.layoutAlign;
  val['size'] = instance.size;
  val['strokes'] = instance.strokes;
  val['strokeWeight'] = instance.strokeWeight;
  val['strokeAlign'] = instance.strokeAlign;
  val['styles'] = instance.styles;
  val['fillsList'] = instance.fillsList;
  val['type'] = instance.type;
  val['imageReference'] = instance.imageReference;
  val['image'] = instance.image;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
};
