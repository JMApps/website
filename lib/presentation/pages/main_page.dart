import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/domain/app_bloc.dart';
import 'package:website/domain/app_repository.dart';
import 'package:website/domain/state/main_state.dart';
import 'package:website/domain/tagline_bloc.dart';
import 'package:website/domain/tagline_repository.dart';
import 'package:website/presentation/desktop/app_pages.dart';
import 'package:website/presentation/phone/app_mobile_pages.dart';
import 'package:website/presentation/widgets/theme_switch.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TagLineRepository tagLineRepository;
  late final TagLineBloc tagLineBloc;
  late final AppRepository appRepository;
  late final AppBloc appBloc;

  @override
  void initState() {
    tagLineRepository = TagLineRepository();
    tagLineBloc = TagLineBloc(tagLineRepository);
    appRepository = AppRepository();
    appBloc = AppBloc(appRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final double screenHeightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<MainState>().getMainColor,
        title: const Text(AppStrings.appTitle),
        actions: const [
          ThemeSwitch(),
        ],
      ),
      body: ScreenTypeLayout.builder(
        desktop: (BuildContext context) => AppPages(appBloc: appBloc),
        mobile: (BuildContext context) => AppMobilePages(appBloc: appBloc),
      ),
    );
  }
}
