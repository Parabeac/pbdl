import 'package:pbdl/pbdl.dart';

abstract class FigmaBaseNode {
  Future<PBDLNode> interpretNode();
}