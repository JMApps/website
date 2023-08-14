class AppModel {
  final int id;
  final String appName;
  final String appDescription;
  final String qrAppStore;
  final String qrGooglePlay;
  final String linkAppStore;
  final String linkGooglePlay;

  AppModel({
    required this.id,
    required this.appName,
    required this.appDescription,
    required this.qrAppStore,
    required this.qrGooglePlay,
    required this.linkAppStore,
    required this.linkGooglePlay,
  });
}
