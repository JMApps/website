import 'package:flutter/material.dart';

class AppStoreQR extends StatelessWidget {
  const AppStoreQR({
    super.key,
    required this.qrAppStoreName,
    required this.qrColor,
  });

  final String qrAppStoreName;
  final Color qrColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/qr/$qrAppStoreName.png',
      height: 150,
      width: 150,
      color: qrColor,
    );
  }
}
