import 'package:hex/hex.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pbdl_color.g.dart';

@JsonSerializable(explicitToJson: true)
class PBDLColor {
  PBDLColor(
    this.a,
    this.r,
    this.g,
    this.b,
  );

  double? a;
  double? r;
  double? g;
  double? b;

  final type = 'color';

  factory PBDLColor.fromJson(Map<String, dynamic> json) =>
      _$PBDLColorFromJson(json);
  Map<String, dynamic> toJson() => _$PBDLColorToJson(this);

  String toHex() {
    if (a != null && b != null && g != null && r != null) {
      int a, r, g, b;
      a = ((this.a ?? 0) * 255).round();
      r = ((this.r ?? 0) * 255).round();
      g = ((this.g ?? 0) * 255).round();
      b = ((this.b ?? 0) * 255).round();
      return '0x' + HEX.encode([a, r, g, b]);
    } else {
      return '0x' + HEX.encode([0, 0, 0, 0]);
    }
  }
}

mixin PBColorMixin {
  String toHex(PBDLColor color) {
    if (color != null) {
      int a, r, g, b;
      a = ((color.a ?? 0) * 255).round();
      r = ((color.r ?? 0) * 255).round();
      g = ((color.g ?? 0) * 255).round();
      b = ((color.b ?? 0) * 255).round();
      return '0x' + HEX.encode([a, r, g, b]);
    } else {
      return '0x' + HEX.encode([0, 0, 0, 0]);
    }
  }

  String? findDefaultColor(String hex) {
    switch (hex) {
      case '0xffffffff':
        return 'Colors.white';
        break;
      case '0xff000000':
        return 'Colors.black';
        break;
    }
    return null;
  }
}
