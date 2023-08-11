import 'package:dio/dio.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/domain/main_app_repository.dart';
import 'package:website/presentation/model/main_app_model.dart';

class ApiMainAppRepository implements MainAppRepository {
  final Dio _dio = Dio();

  @override
  Future<List<MainAppModel>> fetchMainApps() async {
    try {
      final response = await _dio.get('API');
      final data = response.data as List<dynamic>;
      final mainApps = data
          .map(
            (mainAppJson) => MainAppModel(
              appName: mainAppJson['app_name'],
              appDescription: mainAppJson['app_description'],
              screenshots: mainAppJson[''],
              qrAppStore: mainAppJson['qr_app_store'],
              qrGooglePlay: mainAppJson['qr_google_play'],
              appStoreLink: mainAppJson['app_store_link'],
              googlePlayLink: mainAppJson['google_play_link'],
            ),
          ).toList();
      return mainApps;
    } catch (error) {
      throw Exception(AppStrings.errorMessage);
    }
  }

  @override
  Future<void> addMainApp(MainAppModel mainAppModel) async {}
}
