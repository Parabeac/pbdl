class ComponentLinkerService {
  static final ComponentLinkerService _singleton =
      ComponentLinkerService._internal();
  factory ComponentLinkerService() {
    return _singleton;
  }

  ComponentLinkerService._internal();

  /// List stores components on the Figma file
  List<String> skeletonComponents = [];

  List<String> components = [];
}
