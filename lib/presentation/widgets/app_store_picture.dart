import 'package:flutter/material.dart';

class AppStorePicture extends StatelessWidget {
  const AppStorePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/app_store.png',
      width: 150,
    );
  }
}
