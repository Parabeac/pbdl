abstract class FigmaRule {
  String name;
  String desc;
  String details;
  bool validateRule();
  void executeAction();

  FigmaRule({required this.name, required this.desc, required this.details});
}
