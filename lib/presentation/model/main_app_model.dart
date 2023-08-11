class MainAppModel {
  final String appName;
  final String appDescription;
  final List<String> screenshots;
  final String qrAppStore;
  final String qrGooglePlay;
  final String appStoreLink;
  final String googlePlayLink;

  MainAppModel({
    required this.appName,
    required this.appDescription,
    required this.screenshots,
    required this.qrAppStore,
    required this.qrGooglePlay,
    required this.appStoreLink,
    required this.googlePlayLink,
  });
}
