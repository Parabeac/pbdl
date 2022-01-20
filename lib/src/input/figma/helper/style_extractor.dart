import '../entities/layers/figma_font_descriptor.dart';
import '../entities/layers/figma_paragraph_style.dart';
import '../entities/style/figma_border.dart';
import '../entities/style/figma_border_options.dart';
import '../entities/style/figma_color.dart';
import '../entities/style/figma_fill.dart';
import '../entities/style/figma_style.dart';
import '../entities/style/figma_text_style.dart';

/// Helper class used to get and sort the styling of FigmaNodes
class StyleExtractor {
  StyleExtractor();

  FigmaStyle getStyle(Map<String, dynamic> json) {
    if (json != null) {
      var bgColor;
      // Check if color exists in fills
      if (json['background'] != null &&
          json['background'].isNotEmpty &&
          (json['background'][0]['visible'] ?? true)) {
        bgColor = _getColor(json['background'][0]['color']);
      } else {
        bgColor = _getColor(null);
      }

      var textStyle;
      if (json['style'] != null) {
        textStyle = _getTextStyle(json);
      }

      var borders = <FigmaBorder>[];

      var strokes = json['strokes'];

      var borderOptions;

      var visible = strokes.isNotEmpty ? strokes[0]['visible'] : false;

      var figmaBorder = FigmaBorder(
        isEnabled: visible ?? true,
        fillType: strokes.isNotEmpty ? strokes[0]['opacity'] : 1.0,
        color: strokes.isNotEmpty
            ? _getColor(strokes[0]['color'])
            : _getColor(null),
        thickness: json['strokeWeight'],
      );

      var tempVisible = strokes.isNotEmpty ? strokes[0]['visible'] : false;

      borderOptions = FigmaBorderOptions(
        json['strokeDashes'],
        tempVisible ?? true,
        json['strokeCap'],
        json['strokeJoin'],
        json['cornerRadius'],
      );

      borders.add(figmaBorder);

      var fills = <FigmaFill>[];

      var fill = (json['fills'] as List)
          .firstWhere((fill) => fill.containsKey('color'), orElse: () => null);

      // fills.add(FigmaFill(_getColor(fill == null ? null : fill['color'])));

      return FigmaStyle(
        backgroundColor: bgColor,
        borders: borders,
        textStyle: textStyle,
        borderOptions: borderOptions,
        fills: fills,
      );
    } else {
      return null;
    }
  }

  FigmaTextStyle _getTextStyle(Map<String, dynamic> json) {
    var fontColor = json['fills'] != null
        ? _getColor(json['fills'][0]['color'])
        : _getColor(null);
    var fontDescriptor = _getFontDescriptor(json['style']);
    var alignment = _getAlignment(json['style']['textAlignHorizontal']);

    return FigmaTextStyle(
      fontColor: fontColor ??
          FigmaColor(
            alpha: 1,
            red: 0,
            green: 0,
            blue: 0,
          ),
      fontDescriptor: fontDescriptor,
      weight: '${json['style']['fontWeight']}',
      paragraphStyle: FigmaParagraphStyle(alignment: alignment.index),
    );
  }

  ALIGNMENT _getAlignment(String align) {
    switch (align) {
      case 'RIGHT':
        return ALIGNMENT.RIGHT;
        break;
      case 'JUSTIFIED':
        return ALIGNMENT.JUSTIFY;
        break;
      case 'CENTER':
        return ALIGNMENT.CENTER;
        break;
      case 'LEFT':
      default:
        return ALIGNMENT.LEFT;
    }
  }

  FigmaFontDescriptor _getFontDescriptor(Map<String, dynamic> json) {
    return FigmaFontDescriptor(
      json['fontFamily'],
      json['fontSize'],
      json,
      'w' + (json['fontWeight'].toString() ?? '100'),
      json.containsKey('italic') && json['italic'] ? 'italic' : 'normal',
      json['letterSpacing'],
    );
  }

  FigmaColor _getColor(Map<String, dynamic> json) {
    if (json != null && json.isNotEmpty) {
      return FigmaColor(
        alpha: json['a'],
        blue: json['b'],
        green: json['g'],
        red: json['r'],
      );
    } else {
      return null;
    }
  }
}
