import 'package:flutter/material.dart';
import 'package:website/data/api_main_app_repository.dart';
import 'package:website/domain/main_app_bloc.dart';
import 'package:website/domain/main_app_repository.dart';
import 'package:website/presentation/lists/main_app_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final MainAppRepository apiMainAppRepository;
  late final MainAppBloc mainAppBloc;

  @override
  void initState() {
    apiMainAppRepository = ApiMainAppRepository();
    mainAppBloc = MainAppBloc(apiMainAppRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main_background.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: MainAppList(mainAppBloc: mainAppBloc),
      ),
    );
  }
}
