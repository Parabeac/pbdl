import 'package:recase/recase.dart';

class PBInputFormatter {
  ///Formats input to destroy spaces and other intrusive characters.
  ///
  ///Returns an upper-camelcase string if `isTitle` is true,
  ///or a lowercase string otherwise.
  static String formatLabel(String input,
      {bool isTitle = false,
      bool spaceToUnderscore = true,
      bool destroyDigits = false,
      bool destroySpecialSym = false}) {
    var result = _formatStr(input,
        spaceToUnderscore: spaceToUnderscore, destroyDigits: destroyDigits);

    (isTitle)
        ? result = result.replaceRange(0, 1, result[0].toUpperCase())
        : result = result.toLowerCase();
    return result;
  }

  ///Formats `input` to destroy spaces and other intrusive characters.
  ///
  ///Returns a camelCase string.
  static String formatVariable(String input) => _formatStr(input).camelCase;

  static String _formatStr(
    String input, {
    bool spaceToUnderscore = true,
    bool destroyDigits = false,
  }) {
    var result = input;
    // TODO: set a temporal name
    result = (result.isEmpty) ? 'tempName' : result;
    result = removeFirstDigits(result);
    result = result.trim();
    var spaceChar = (spaceToUnderscore) ? '_' : '';
    result = result.replaceAll(r'[\s\./_+-?]+', spaceChar);
    result = result.replaceAll(RegExp(r'\s+'), spaceChar);
    result = (destroyDigits) ? result.replaceAll(RegExp(r'\d+'), '') : result;
    result = result.replaceAll(' ', '').replaceAll(RegExp(r'[^\s\w]'), '');
    result = result.replaceAll(RegExp(r'[^a-zA-Z\d\s:]'), '');
    return result;
  }

  static String removeFirstDigits(String str) =>
      str.startsWith(RegExp(r'^[\d]+'))
          ? str.replaceFirstMapped(RegExp(r'^[\d]+'), (e) => '')
          : str;
}
