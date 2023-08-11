import 'package:flutter/material.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/presentation/model/main_app_model.dart';
import 'package:website/presentation/phone/app_screenshots_phone.dart';
import 'package:website/presentation/widgets/qr_links.dart';
import 'package:website/presentation/widgets/text_app_description.dart';
import 'package:website/presentation/widgets/text_app_name.dart';

class MainAppItemPhone extends StatelessWidget {
  final MainAppModel item;

  const MainAppItemPhone({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: AppStyles.mainMargin,
      color: const Color(0xBFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Column(
          children: [
            TextAppName(appName: item.appName, fontSize: 22),
            const SizedBox(height: 16),
            TextAppDescription(appDescription: item.appDescription, fontSize: 18),
            const SizedBox(height: 16),
            AppScreenshotsPhone(item: item),
            const SizedBox(height: 16),
            const QRLinks(),
          ],
        ),
      ),
    );
  }
}
