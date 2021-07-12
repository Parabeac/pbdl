import 'package:hex/hex.dart';
import 'package:json_annotation/json_annotation.dart';

part 'color.g.dart';

@JsonSerializable()
class PBDLColor {
  PBDLColor(
    this.alpha,
    this.red,
    this.green,
    this.blue,
  );

  double alpha;
  double red;
  double green;
  double blue;

  factory PBDLColor.fromJson(Map<String, dynamic> json) =>
      _$PBColorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PBColorToJson(this);
}

mixin PBColorMixin {
  String toHex(PBDLColor color) {
    if (color != null) {
      int a, r, g, b;
      a = ((color.alpha ?? 0) * 255).round();
      r = ((color.red ?? 0) * 255).round();
      g = ((color.green ?? 0) * 255).round();
      b = ((color.blue ?? 0) * 255).round();
      return '0x' + HEX.encode([a, r, g, b]);
    } else {
      return '0x' + HEX.encode([0, 0, 0, 0]);
    }
  }

  String findDefaultColor(String hex) {
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
