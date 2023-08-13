class MainAppModel {
  final int id;
  final String appName;
  final String appDescription;
  final String qrAppStore;
  final String qrGooglePlay;
  final String appStoreLink;
  final String googlePlayLink;
  final List<dynamic> appTextUpdate;
  final List<dynamic> appScreen;

  MainAppModel({
    required this.id,
    required this.appName,
    required this.appDescription,
    required this.qrAppStore,
    required this.qrGooglePlay,
    required this.appStoreLink,
    required this.googlePlayLink,
    required this.appTextUpdate,
    required this.appScreen,
  });

  factory MainAppModel.fromMap(Map<String, dynamic> map) {
    return MainAppModel(
      id: map['id'] ?? 0,
      appName: map['app_name'] ?? '',
      appDescription: map['app_description'] ?? '',
      qrAppStore: map['qr_app_store'] ?? '',
      qrGooglePlay: map['qr_google_play'] ?? '',
      appStoreLink: map['link_app_store'] ?? '',
      googlePlayLink: map['link_google_play'] ?? '',
      appTextUpdate: map['app_text_update'] ?? [],
      appScreen: map['app_screen'] ?? [],
    );
  }
}
