import 'package:json_annotation/json_annotation.dart';
import 'package:hex/hex.dart';
part 'figma_color.g.dart';

@JsonSerializable()
class FigmaColor {
  @override
  @JsonKey(name: 'a')
  double alpha;

  @override
  @JsonKey(name: 'b')
  double blue;

  @override
  @JsonKey(name: 'g')
  double green;

  @override
  @JsonKey(name: 'r')
  double red;

  FigmaColor({this.alpha, this.red, this.green, this.blue});

  @override
  Map<String, dynamic> toJson() => _$FigmaColorToJson(this);

  factory FigmaColor.fromJson(Map<String, dynamic> json) =>
      _$FigmaColorFromJson(json);
}

mixin PBColorMixin {
  String toHex(FigmaColor color) {
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
