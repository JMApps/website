import 'package:flutter/material.dart';

class GooglePlayQR extends StatelessWidget {
  const GooglePlayQR({
    super.key,
    required this.qrGooglePlayName,
    required this.qrColor,
  });

  final String qrGooglePlayName;
  final Color qrColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/qr/$qrGooglePlayName.png',
      gaplessPlayback: true,
      height: 150,
      width: 150,
      color: qrColor,
    );
  }
}
