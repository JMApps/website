import 'package:flutter/material.dart';

class AppStoreQR extends StatelessWidget {
  const AppStoreQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/qr_code.png',
      width: 150,
    );
  }
}
