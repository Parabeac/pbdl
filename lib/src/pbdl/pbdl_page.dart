// maybe we dont need this one anymore, or we might use it for PBDL

import 'package:pbdl/src/pbdl/abstract_pbdl_node_factory.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'package:quick_log/quick_log.dart';
import 'pbdl_screen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_page.g.dart';

@JsonSerializable()
class PBDLPage implements PBDLNodeFactory {
  @JsonKey(ignore: true)
  var log = Logger('DesignPage');

  String id;
  String imageURI;
  String name;
  bool convert = true;
  List<PBDLScreen> screens = [];

  PBDLPage({
    this.name,
    this.id,
  }) {
    screens = [];
  }

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
  PBDLPage createPBDLNode(Map<String, dynamic> json) => PBDLPage.fromJson(json);
  factory PBDLPage.fromJson(Map<String, dynamic> json) =>
      _$PBDLPageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBDLPageToJson(this);
}
