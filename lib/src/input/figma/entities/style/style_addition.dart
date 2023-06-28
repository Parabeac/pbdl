/// Class that represents a StyleNode with the ability
/// for another StyleNode to be added to it.
///
/// This is helpful when combining multiple fills or strokes
abstract class StyleAdditionNode {
  String? type;
  /// Returns what [this] StyleNode would return if it were
  /// combined with [style].
  String addStyle(StyleAdditionNode style);
}
