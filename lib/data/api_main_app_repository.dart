import 'package:dio/dio.dart';
import 'package:website/domain/main_app_repository.dart';
import 'package:website/presentation/model/main_app_model.dart';

class ApiMainAppRepository implements MainAppRepository {
  final Dio _dio = Dio();

  @override
  Future<List<MainAppModel>> fetchMainApps() async {
    final response = await _dio.get('https://jmapps.net/api/v1/');
    final List<dynamic> data = response.data;
    final mainApps = data.map((mainAppJson) => MainAppModel.fromMap(mainAppJson)).toList();
    return mainApps;
  }

  @override
  Future<void> addMainApp(MainAppModel mainAppModel) async {}
}
