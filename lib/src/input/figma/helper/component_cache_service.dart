/// This class is in charge of caching the components IDs
class ComponentCacheService {
  static final ComponentCacheService _singleton =
      ComponentCacheService._internal();
  factory ComponentCacheService() {
    return _singleton;
  }

  ComponentCacheService._internal();

  /// List that stores the symbol IDs of
  /// all the components on the file
  Map<String?, Map> localComponents = {};

  /// Get compoennt set id, to pass it to its instances
  String? getComponentSetId(String? symbolID) {
    if (localComponents.containsKey(symbolID)) {
      return localComponents[symbolID]!['componentSetId'];
    } else {
      return null;
    }
  }
}
