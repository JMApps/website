import 'package:flutter/material.dart';
import 'package:website/presentation/widgets/app_store_picture.dart';
import 'package:website/presentation/widgets/app_store_qr.dart';
import 'package:website/presentation/widgets/google_play_picture.dart';
import 'package:website/presentation/widgets/google_play_qr.dart';

class QRLinks extends StatelessWidget {
  const QRLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: AppStoreQR(),
            ),
            SizedBox(width: 16),
            SizedBox(
              height: 150,
              width: 150,
              child: GooglePlayQR(),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppStorePicture(),
            SizedBox(width: 16),
            GooglePlayPicture(),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
