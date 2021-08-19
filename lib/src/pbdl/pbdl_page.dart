import 'package:pbdl/src/pbdl/pbdl_constraints.dart';
import 'package:pbdl/src/pbdl/pbdl_frame.dart';
import 'package:pbdl/src/pbdl/pbdl_style.dart';
import 'package:quick_log/quick_log.dart';
import 'package:pbdl/src/pbdl/pbdl_node.dart';
import 'abstract_pbdl_node_factory.dart';
import 'pbdl_screen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_page.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PBDLPage extends PBDLNode implements PBDLNodeFactory {
  @JsonKey(ignore: true)
  var log = Logger('DesignPage');

  String imageURI;
  bool convert = true;

  List<PBDLNode> screens = [];

  PBDLPage({
    String name,
    String UUID,
    this.screens,
  }): super(UUID, name, true, null, null, null);

  void addScreen(PBDLScreen item) {
    screens.add(item);
  }

  List<PBDLScreen> getPageItems() {
    log.info('We encountered a page that has ${screens.length} page items.');
    return screens;
  }

  @override
  PBDLNode createPBDLNode(Map<String, dynamic> json) => PBDLPage.fromJson(json);
  factory PBDLPage.fromJson(Map<String, dynamic> json) =>
      _$PBDLPageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PBDLPageToJson(this);

  @override
  String type = 'page';
}
