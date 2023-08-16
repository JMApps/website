import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/application/routes/app_routes.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/application/themes/app_themes.dart';
import 'package:website/domain/state/main_state.dart';
import 'package:website/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainState(),
        ),
      ],
      child: Consumer<MainState>(
        builder: (context, mainState, _) {
          return MaterialApp(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.unknown,
              },
            ),
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: mainState.getDarkThemeState ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: AppRoutes.onGeneratorRoue,
            onUnknownRoute: AppRoutes.onUnknownRoute,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
