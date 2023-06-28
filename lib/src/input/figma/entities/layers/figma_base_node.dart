import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl.dart';

@JsonSerializable()
abstract class FigmaBaseNode {
  FigmaBaseNode();
  Future<PBDLNode?> interpretNode();

  factory FigmaBaseNode.fromJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();
}
