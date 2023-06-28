import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/pbdl/pbdl_constraints.dart';

part 'figma_constraints.g.dart';

/// Defined by https://www.figma.com/plugin-docs/api/Constraints/
@JsonSerializable(nullable: true)
class FigmaConstraints {
  FigmaConstraints(this.horizontal, this.vertical);
  FigmaConstraintType? horizontal;
  FigmaConstraintType? vertical;

  factory FigmaConstraints.fromJson(Map<String, dynamic> json) =>
      _$FigmaConstraintsFromJson(json);
  Map<String, dynamic> toJson() => _$FigmaConstraintsToJson(this);

  PBDLConstraints interpret() {
    var constraints = PBDLConstraints();
    constraints = _convertFigmaConstraint(horizontal, constraints, false);
    return _convertFigmaConstraint(vertical, constraints, true);
  }

  PBDLConstraints _convertFigmaConstraint(
      FigmaConstraintType? figmaConstraintType,
      PBDLConstraints constraints,
      bool isVertical) {
    if (figmaConstraintType == FigmaConstraintType.SCALE) {
      if (isVertical) {
        constraints.pinTop = false;
        constraints.pinBottom = false;
        constraints.fixedHeight = false;
      } else {
        constraints.pinLeft = false;
        constraints.pinRight = false;
        constraints.fixedWidth = false;
      }
    } else if (figmaConstraintType == FigmaConstraintType.TOP) {
      constraints.pinTop = true;
      constraints.pinBottom = false;
      constraints.fixedHeight = true;
    } else if (figmaConstraintType == FigmaConstraintType.LEFT) {
      constraints.pinLeft = true;
      constraints.pinRight = false;
      constraints.fixedWidth = true;
    } else if (figmaConstraintType == FigmaConstraintType.RIGHT) {
      constraints.pinLeft = false;
      constraints.pinRight = true;
      constraints.fixedWidth = true;
    } else if (figmaConstraintType == FigmaConstraintType.BOTTOM) {
      constraints.pinTop = false;
      constraints.pinBottom = true;
      constraints.fixedHeight = true;
    } else if (figmaConstraintType == FigmaConstraintType.CENTER) {
      if (isVertical) {
        constraints.pinTop = false;
        constraints.pinBottom = false;
        constraints.fixedHeight = true;
      } else {
        constraints.pinLeft = false;
        constraints.pinRight = false;
        constraints.fixedWidth = true;
      }
    } else if (figmaConstraintType == FigmaConstraintType.TOP_BOTTOM) {
      constraints.pinTop = true;
      constraints.pinBottom = true;
      constraints.fixedHeight = false;
    } else if (figmaConstraintType == FigmaConstraintType.LEFT_RIGHT) {
      constraints.pinLeft = true;
      constraints.pinRight = true;
      constraints.fixedWidth = false;
    } else {
      print(
          'We currently do not support Figma Constraint Type: $figmaConstraintType');
    }
    return constraints;
  }
}

enum FigmaConstraintType {
  @JsonValue('CENTER')
  CENTER,
  @JsonValue('TOP_BOTTOM')
  TOP_BOTTOM,
  @JsonValue('LEFT_RIGHT')
  LEFT_RIGHT,
  @JsonValue('SCALE')
  SCALE,
  @JsonValue('TOP')
  TOP,
  @JsonValue('BOTTOM')
  BOTTOM,
  @JsonValue('RIGHT')
  RIGHT,
  @JsonValue('LEFT')
  LEFT
}
