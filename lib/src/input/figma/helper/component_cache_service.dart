class ComponentCacheService {
  static final ComponentCacheService _singleton =
      ComponentCacheService._internal();
  factory ComponentCacheService() {
    return _singleton;
  }

  ComponentCacheService._internal();

  List<String> localComponents = [];
}
