import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/domain/state/main_state.dart';
import 'package:website/domain/tagline_bloc.dart';
import 'package:website/domain/tagline_repository.dart';
import 'package:website/presentation/desktop/tagline_column.dart';
import 'package:website/presentation/widgets/theme_switch.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final TagLineRepository tagLineRepository;
  late final TagLineBloc tagLineBloc;

  @override
  void initState() {
    tagLineRepository = TagLineRepository();
    tagLineBloc = TagLineBloc(tagLineRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<MainState>().getMainColor,
        title: const Text(AppStrings.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/main/applications');
            },
            icon: const Icon(Icons.apps),
          ),
          const ThemeSwitch(),
        ],
      ),
      body: ScreenTypeLayout.builder(
        desktop: (BuildContext context) => TagLineColumn(tagLineBloc: tagLineBloc),
        mobile: (BuildContext context) => TagLineColumn(tagLineBloc: tagLineBloc),
      ),
    );
  }
}
