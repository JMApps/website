import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/domain/state/main_content_state.dart';

class GooglePlayQR extends StatelessWidget {
  const GooglePlayQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${AppStrings.appLinkForApi}${context.read<MainContentState>().getMainApps[0].qrGooglePlay}',
      gaplessPlayback: true,
      height: 150,
      width: 150,
    );
  }
}
