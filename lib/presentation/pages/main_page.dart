import 'package:flutter/material.dart';
import 'package:website/domain/main_app_bloc.dart';
import 'package:website/domain/main_app_repository.dart';
import 'package:website/presentation/lists/main_app_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final MainAppRepository mainAppRepository;
  late final MainAppBloc mainAppBloc;

  @override
  void initState() {
    mainAppRepository = MainAppRepository();
    mainAppBloc = MainAppBloc(mainAppRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainAppList(mainAppBloc: mainAppBloc),
    );
  }
}
