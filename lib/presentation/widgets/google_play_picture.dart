import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GooglePlayPicture extends StatelessWidget {
  const GooglePlayPicture({super.key, required this.linkGooglePlay});

  final String linkGooglePlay;

  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.parse(linkGooglePlay);
    return GestureDetector(
      onTap: () async {
        !await launchUrl(uri);
      },
      child: Image.asset(
        'assets/icons/google_play.png',
        width: 150,
      ),
    );
  }
}
