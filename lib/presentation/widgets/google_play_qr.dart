import 'package:flutter/material.dart';

class GooglePlayQR extends StatelessWidget {
  const GooglePlayQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/qr_code.png',
      width: 150,
    );
  }
}
