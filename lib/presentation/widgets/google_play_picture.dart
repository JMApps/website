import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/domain/state/main_content_state.dart';

class GooglePlayPicture extends StatelessWidget {
  const GooglePlayPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.parse(context.read<MainContentState>().getMainApps[0].googlePlayLink);
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
