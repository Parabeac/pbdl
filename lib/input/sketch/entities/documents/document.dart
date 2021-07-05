import 'package:pbdl/input/sketch/entities/documents/abstract_document.dart';
import 'package:pbdl/input/sketch/entities/objects/foreign_symbol.dart';
import 'package:json_annotation/json_annotation.dart';

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
