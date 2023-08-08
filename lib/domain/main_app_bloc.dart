import 'dart:async';

import 'package:website/domain/main_app_repository.dart';
import 'package:website/presentation/model/main_app_model.dart';

class MainAppBloc {
  final MainAppRepository _mainAppRepository;

  MainAppBloc(this._mainAppRepository);

  List<MainAppModel> _mainApps = [];

  List<MainAppModel> get getMainApps => _mainApps;

  Future<List<MainAppModel>> _loadMainAppModels() async {
    return _mainApps = await _mainAppRepository.fetchMainApps();
  }

  Future<List<MainAppModel>> get getLoadMainAppModels => _loadMainAppModels();

  Future<void> addNewApp(MainAppModel mainAppModel) async {
    await _mainAppRepository.addMainApp(mainAppModel);
    _mainApps.add(mainAppModel);
  }
}
