import 'package:json_annotation/json_annotation.dart';

import '../objects/foreign_symbol.dart';
import 'abstract_document.dart';

part 'document.g.dart';

// title: Document
// description: The document entry in a Sketch file.
@JsonSerializable()
class Document extends AbstractDocument {
  List pages;

  Document(
      this.pages,
      UUID,
      assets,
      colorSpace,
      currentPageIndex,
      List foreignLayerStyles,
      List<ForeignSymbol> foreignSymbols,
      List foreignTextStyles,
      layerStyles,
      layerTextStyles,
      layerSymbols,
      List embeddedFontReferences,
      bool autoEmbedFonts,
      bool agreedToFontEmbedding)
      : super(
            UUID,
            assets,
            colorSpace,
            currentPageIndex,
            foreignLayerStyles,
            foreignSymbols,
            foreignTextStyles,
            layerStyles,
            layerTextStyles,
            layerSymbols,
            embeddedFontReferences,
            autoEmbedFonts,
            agreedToFontEmbedding);
  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
