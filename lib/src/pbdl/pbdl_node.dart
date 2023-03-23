import 'package:pbdl/pbdl.dart';
import 'package:pbdl/src/pbdl/pbdl_boundary_box.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:quick_log/quick_log.dart';
import 'package:json_annotation/json_annotation.dart';

import 'properties/pbdl_master_property_reference.dart';

part 'pbdl_node.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLNode implements Comparable<PBDLNode> {
  /// [UUID] that is inherited from the design node
  String UUID;

  @JsonKey(fromJson: parentLayoutFromString)
  ParentLayoutSizing layoutMainAxisSizing;
  @JsonKey(fromJson: parentLayoutFromString)
  ParentLayoutSizing layoutCrossAxisSizing;

  @JsonKey(includeIfNull: false)
  MasterPropertyReference masterPropertyReferences;

  @JsonKey(ignore: true)
  Logger logger;
  String name;
  bool isVisible;
  PBDLBoundaryBox boundaryRectangle;
  String pbdlType;
  PBDLStyle style;
  String prototypeNodeUUID;
  PBDLNode child;
  @JsonKey()
  PBDLConstraints constraints;
  PBDLNode(
    this.UUID,
    this.name,
    this.isVisible,
    this.boundaryRectangle,
    this.style,
    this.prototypeNodeUUID, {
    transitionDuration,
    transitionEasing,
    this.child,
    this.constraints,
    this.layoutMainAxisSizing,
    this.layoutCrossAxisSizing,
    this.masterPropertyReferences,
  }) {
    logger = Logger(runtimeType.toString());
  }

  /// Method that sorts the [PBDLProject]'s nodes based on [UUID].
  ///
  /// This is done in order to consistently generate PBDL files in the same order
  void sortByUUID() {
    if (child != null) {
      child.sortByUUID();
    }
  }

  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLNode.fromJson(json);

  Map<String, dynamic> toJson() => _$PBDLNodeToJson(this);

  factory PBDLNode.fromJson(Map<String, dynamic> json) =>
      AbstractPBDLNodeFactory.getPBDLNode(json);

  /// Compares `this` [PBDLNode] to `other` based on `UUID` to make it simpler to sort elements
  @override
  int compareTo(PBDLNode other) => UUID.compareTo(other.UUID);

  static ParentLayoutSizing parentLayoutFromString(String value) {
    for (var enumVal in ParentLayoutSizing.values) {
      if (enumVal.toString().split('.')[1] == value) {
        return enumVal;
      }
    }

    return ParentLayoutSizing.INHERIT;
  }
}

enum ParentLayoutSizing {
  @JsonValue('INHERIT')
  INHERIT,
  @JsonValue('STRETCH')
  STRETCH,
  @JsonValue('NONE')
  NONE,
}
