import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/src/input/figma/entities/layers/figma_base_node.dart';
import 'package:pbdl/src/pbdl/pbdl_color.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
part 'figma_color.g.dart';

@JsonSerializable()
class FigmaColor extends FigmaBaseNode {
  @JsonKey(name: 'a')
  double? alpha;

  @JsonKey(name: 'b')
  double? blue;

  @JsonKey(name: 'g')
  double? green;

  @JsonKey(name: 'r')
  double? red;

  FigmaColor({this.alpha, this.red, this.green, this.blue});

  Map<String, dynamic> toJson() => _$FigmaColorToJson(this);

  factory FigmaColor.fromJson(Map<String, dynamic> json) =>
      _$FigmaColorFromJson(json);

  PBDLColor interpretColor() {
    return PBDLColor(alpha, red, green, blue);
  }

  @override
  Future<PBDLNode> interpretNode() {
    // TODO: implement interpretNode
    throw UnimplementedError();
  }
}
