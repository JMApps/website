import 'package:website/presentation/model/main_app_model.dart';

class MainAppRepository {
  Future<List<MainAppModel>> fetchMainApps() async {
    return [
      MainAppModel(
        id: 0,
        appName: 'Полка мусульманина',
        appDescription: 'Описание приложения',
        screenshots: ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
        qrAppStore: 'qrAppStore',
        qrGooglePlay: 'qrGooglePlay',
        appStoreLink: 'https://apps.apple.com/tr/app/полка-мусульманина/id1659190395',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=jmapps.project.majmua',
      ),
      MainAppModel(
        id: 1,
        appName: 'Крепость мусульманина',
        appDescription: 'Описание приложения',
        screenshots: ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
        qrAppStore: 'qrAppStore',
        qrGooglePlay: 'qrGooglePlay',
        appStoreLink: 'https://apps.apple.com/ru/app/крепость-верующего/id1564920951',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=jmapps.fortressofthemuslim',
      ),
    ];
  }

  Future<void> addMainApp(MainAppModel mainAppModel) async {}
}
