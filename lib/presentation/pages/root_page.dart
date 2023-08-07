import 'package:flutter/material.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/presentation/pages/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      home: MainPage(),
    );
  }
}