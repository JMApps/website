class MainAppModel {
  final int id;
  final String appName;
  final String appDescription;
  final List<String> screenshots;
  final String qrAppStore;
  final String qrGooglePlay;
  final String appStoreLink;
  final String googlePlayLink;

  MainAppModel({
    required this.id,
    required this.appName,
    required this.appDescription,
    required this.screenshots,
    required this.qrAppStore,
    required this.qrGooglePlay,
    required this.appStoreLink,
    required this.googlePlayLink,
  });

  factory MainAppModel.fromMap(Map<String, dynamic> map) {
    return MainAppModel(
      id: map['id'] ?? 0,
      appName: map['app_name'] ?? '',
      appDescription: map['app_description'] ?? '',
      screenshots: map['screenshots'] ?? '',
      qrAppStore: map['qr_app_store'] ?? '',
      qrGooglePlay: map['qr_google_play'] ?? '',
      appStoreLink: map['link_app_store'] ?? '',
      googlePlayLink: map['link_google_play'] ?? '',
    );
  }
}
