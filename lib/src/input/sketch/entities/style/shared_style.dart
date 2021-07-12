import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

import 'color.dart';
import 'font_descriptor.dart';
import 'style.dart';
part 'shared_style.g.dart';

Map<String, String> SharedStyle_UUIDToName = {};

@JsonSerializable()
class SharedStyle with PBColorMixin {
  @JsonKey(name: '_class')
  final String classField;
  @override
  @JsonKey(name: 'do_objectID')
  String UUID;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  Style style;

  SharedStyle({
    this.classField,
    this.UUID,
    this.name,
    this.style,
  }) {
    name = name.camelCase;
    SharedStyle_UUIDToName[UUID] = name.replaceAll(
        RegExp(
          r'[^A-Za-z0-9_]',
        ),
        '');
  }

  String generate() {
    var buffer = StringBuffer();

    if (style != null) {
      // TODO: implement SharedStyle.style to flutter style parameters.
      if (style.textStyle != null) {
        var source = style.textStyle;
        var fontDescriptor = source.fontDescriptor as FontDescriptor;
        buffer.write('TextStyle ${name} = TextStyle(\n');
        if (fontDescriptor.fontName != null) {
          buffer.write('fontFamily: \'${source.fontDescriptor.fontName}\',\n');
        }
        if (fontDescriptor.fontSize != null) {
          buffer.write('fontSize: ${fontDescriptor.fontSize.toString()},\n');
        }
        if (fontDescriptor.fontWeight != null) {
          buffer.write(
              'fontWeight: FontWeight.${fontDescriptor.fontWeight.toString()},\n');
        }

        if (fontDescriptor.fontStyle != null) {
          buffer.write('fontStyle: FontStyle.${fontDescriptor.fontStyle},\n');
        }
        if (fontDescriptor.letterSpacing != null) {
          buffer.write('letterSpacing: ${fontDescriptor.letterSpacing},\n');
        }

        if (source.fontColor != null) {
          var color = toHex(source.fontColor);
          var defColor = findDefaultColor(color);
          if (defColor == null) {
            buffer.write('color: Color(${color}),');
          } else {
            buffer.write('color: ${defColor},');
          }
        }

        buffer.write(');\n');
      }
    }

    return buffer.toString();
  }

  factory SharedStyle.fromJson(Map json) => _$SharedStyleFromJson(json);
  Map<String, dynamic> toJson() => _$SharedStyleToJson(this);
}
