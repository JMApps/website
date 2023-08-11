import 'package:flutter/material.dart';

class GooglePlayPicture extends StatelessWidget {
  const GooglePlayPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/google_play.png',
      width: 150,
    );
  }
}
