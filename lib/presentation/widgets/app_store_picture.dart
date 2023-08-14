import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppStorePicture extends StatelessWidget {
  const AppStorePicture({super.key, required this.linkAppStore});

  final String linkAppStore;

  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.parse(linkAppStore);
    return GestureDetector(
      onTap: () async {
        !await launchUrl(uri);
      },
      child: Image.asset(
        'assets/icons/app_store.png',
        width: 150,
      ),
    );
  }
}
