import 'package:flutter/material.dart';
import 'package:website/domain/app_repository.dart';
import 'package:website/presentation/desktop/app_model.dart';

class AppBloc {
  final AppRepository _appRepository;

  final PageController _appPageController = PageController();

  PageController get getAppPageController => _appPageController;

  AppBloc(this._appRepository);

  List<AppModel> _apps = [];

  List<AppModel> get getApps => _apps;

  Future<List<AppModel>> _loadApps() async {
    return _apps = await _appRepository.fetchApps();
  }

  Future<List<AppModel>> get getLoadApps => _loadApps();
}
