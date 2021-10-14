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
  List<String> localComponents = [];
}
