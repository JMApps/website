import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/state/main_content_state.dart';

class AppStorePicture extends StatelessWidget {
  const AppStorePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final MainContentState contentState = context.read<MainContentState>();
    final Uri uri = Uri.parse(contentState.getMainApps[0].appStoreLink);
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
