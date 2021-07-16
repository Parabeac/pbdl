import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:quick_log/quick_log.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_screen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_page.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLPage implements PBDLNodeFactory, PBDLNode {
  @JsonKey(ignore: true)
  var log = Logger('DesignPage');

  String id;
  String imageURI;
  @override
  String name;
  bool convert = true;

  List<PBDLScreen> screens = [];

  PBDLPage({
    this.name,
    this.id,
    this.screens,
  });

  void addScreen(PBDLScreen item) {
    screens.add(item);
  }

  List<PBDLScreen> getPageItems() {
    log.info('We encountered a page that has ${screens.length} page items.');
    return screens;
  }

  @override
  String pbdfType = 'design_page';

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLPage.fromJson(json);
  factory PBDLPage.fromJson(Map<String, dynamic> json) =>
      _$PBDLPageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLPageToJson(this);

  @override
  String UUID;

  @override
  var boundaryRectangle;

  @override
  PBDLNode child;

  @override
  bool isVisible;

  @override
  String prototypeNodeUUID;

  @override
  PBDLStyle style;

  @override
  String type;
}
