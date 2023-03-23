// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pbdl_boolean_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PBDLBooleanOperation _$PBDLBooleanOperationFromJson(Map<String, dynamic> json) {
  return PBDLBooleanOperation(
    children: json['children'],
    booleanOperation: json['booleanOperation'],
    style: json['style'] == null
        ? null
        : PBDLStyle.fromJson(json['style'] as Map<String, dynamic>),
    boundaryRectangle: json['boundaryRectangle'] == null
        ? null
        : PBDLBoundaryBox.fromJson(
            json['boundaryRectangle'] as Map<String, dynamic>),
    UUID: json['UUID'] as String,
    prototypeNodeUUID: json['prototypeNodeUUID'],
    imageReference: json['imageReference'],
    constraints: json['constraints'] == null
        ? null
        : PBDLConstraints.fromJson(json['constraints'] as Map<String, dynamic>),
    layoutMainAxisSizing:
        PBDLNode.parentLayoutFromString(json['layoutMainAxisSizing'] as String),
    layoutCrossAxisSizing: PBDLNode.parentLayoutFromString(
        json['layoutCrossAxisSizing'] as String),
    masterPropertyReferences: json['masterPropertyReferences'] == null
        ? null
        : MasterPropertyReference.fromJson(
            json['masterPropertyReferences'] as Map<String, dynamic>),
  )
    ..child = json['child'] == null
        ? null
        : PBDLNode.fromJson(json['child'] as Map<String, dynamic>)
    ..layoutAlign = json['layoutAlign']
    ..size = json['size']
    ..strokes = json['strokes']
    ..strokeWeight = json['strokeWeight']
    ..strokeAlign = json['strokeAlign']
    ..styles = json['styles']
    ..fillsList = json['fillsList']
    ..pbdlType = json['pbdlType'] as String
    ..name = json['name'] as String
    ..isVisible = json['isVisible'] as bool
    ..image = json['image'];
}

Map<String, dynamic> _$PBDLBooleanOperationToJson(
    PBDLBooleanOperation instance) {
  final val = <String, dynamic>{
    'layoutMainAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutMainAxisSizing],
    'layoutCrossAxisSizing':
        _$ParentLayoutSizingEnumMap[instance.layoutCrossAxisSizing],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'masterPropertyReferences', instance.masterPropertyReferences?.toJson());
  val['child'] = instance.child?.toJson();
  val['constraints'] = instance.constraints?.toJson();
  val['layoutAlign'] = instance.layoutAlign;
  val['size'] = instance.size;
  val['strokes'] = instance.strokes;
  val['strokeWeight'] = instance.strokeWeight;
  val['strokeAlign'] = instance.strokeAlign;
  val['styles'] = instance.styles;
  val['fillsList'] = instance.fillsList;
  val['children'] = instance.children?.map((e) => e?.toJson())?.toList();
  val['booleanOperation'] = instance.booleanOperation;
  val['pbdlType'] = instance.pbdlType;
  val['boundaryRectangle'] = instance.boundaryRectangle?.toJson();
  val['imageReference'] = instance.imageReference;
  val['UUID'] = instance.UUID;
  val['name'] = instance.name;
  val['prototypeNodeUUID'] = instance.prototypeNodeUUID;
  val['style'] = instance.style?.toJson();
  val['isVisible'] = instance.isVisible;
  val['image'] = instance.image;
  return val;
}

const _$ParentLayoutSizingEnumMap = {
  ParentLayoutSizing.INHERIT: 'INHERIT',
  ParentLayoutSizing.STRETCH: 'STRETCH',
  ParentLayoutSizing.NONE: 'NONE',
};
