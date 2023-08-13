import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/data/api_main_app_repository.dart';
import 'package:website/domain/main_app_repository.dart';
import 'package:website/domain/state/main_content_state.dart';
import 'package:website/presentation/pages/main_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final MainAppRepository mainAppRepository = ApiMainAppRepository();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainContentState(mainAppRepository))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        home: MainPage(),
      ),
    );
  }
}
