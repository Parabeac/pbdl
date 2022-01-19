import 'package:json_annotation/json_annotation.dart';
import 'package:hex/hex.dart';
import 'package:pbdl/src/pbdl/pbdl_color.dart';
part 'figma_color.g.dart';

@JsonSerializable()
class FigmaColor {
  @JsonKey(name: 'opacity')
  double alpha;

  @JsonKey(name: 'b')
  double blue;

  @JsonKey(name: 'g')
  double green;

  @JsonKey(name: 'r')
  double red;

  FigmaColor({this.alpha, this.red, this.green, this.blue});

  Map<String, dynamic> toJson() => _$FigmaColorToJson(this);

  factory FigmaColor.fromJson(Map<String, dynamic> json) =>
      _$FigmaColorFromJson(json);

  PBDLColor interpretColor() {
    return PBDLColor(alpha, red, green, blue);
  }
}

// mixin PBColorMixin {
//   String toHex(FigmaColor color) {
//     if (color != null) {
//       int a, r, g, b;
//       a = ((color.alpha ?? 0) * 255).round();
//       r = ((color.red ?? 0) * 255).round();
//       g = ((color.green ?? 0) * 255).round();
//       b = ((color.blue ?? 0) * 255).round();
//       return '0x' + HEX.encode([a, r, g, b]);
//     } else {
//       return '0x' + HEX.encode([0, 0, 0, 0]);
//     }
//   }

//   String findDefaultColor(String hex) {
//     switch (hex) {
//       case '0xffffffff':
//         return 'Colors.white';
//         break;
//       case '0xff000000':
//         return 'Colors.black';
//         break;
//     }
//     return null;
//   }
// }
