class MainAppModel {
  final String appName;
  final String appDescription;
  final List<String> screenshots;
  final String appStoreLink;
  final String googlePlayLink;

  MainAppModel({
    required this.appName,
    required this.appDescription,
    required this.screenshots,
    required this.appStoreLink,
    required this.googlePlayLink,
  });
}
