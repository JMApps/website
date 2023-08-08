import 'package:website/presentation/model/main_app_model.dart';

class MainAppRepository {
  Future<List<MainAppModel>> fetchMainApps() async {
    return [
      MainAppModel(
        title: 'Полка мусульманина',
        appDescription: 'Описание приложения',
        screenshots: ['sm_screen_1', 'sm_screen_2', 'sm_screen_3'],
        googlePlayLink: 'goolge play link',
        appStoreLink: 'app store link',
      ),
    ];
  }

  Future<void> addMainApp(MainAppModel mainAppModel) async {}
}
