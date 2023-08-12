import 'package:flutter/material.dart';
import 'package:website/presentation/lists/main_app_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/main_background.jpg'),
          fit: BoxFit.cover,
        )),
        child: const MainAppList(),
      ),
    );
  }
}
