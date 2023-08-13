import 'package:website/presentation/model/main_app_model.dart';

abstract class MainAppRepository {
  Future<List<MainAppModel>> fetchMainApps();

  Future<void> addMainApp(MainAppModel mainAppModel);
}
