import 'package:json_annotation/json_annotation.dart';
import 'package:hex/hex.dart';
import 'package:pbdl/src/pbdl/pbdl_color.dart';
part 'color.g.dart';

@JsonSerializable()
class Color {
  @JsonKey(name: '_class')
  final String classField;
  double alpha, blue, green, red;

  Color({this.alpha, this.blue, this.classField, this.green, this.red});

  factory Color.fromJson(Map json) => _$ColorFromJson(json);
  Map toJson() => _$ColorToJson(this);

  PBDLColor interpretColor() {
    return PBDLColor(alpha, red, green, blue);
  }
}

mixin PBColorMixin {
  String toHex(Color color) {
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
