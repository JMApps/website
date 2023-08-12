import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/domain/state/main_content_state.dart';
import 'package:website/presentation/desktop/main_app_item_desktop.dart';
import 'package:website/presentation/model/main_app_model.dart';
import 'package:website/presentation/phone/main_app_item_phone.dart';
import 'package:website/presentation/tablet/main_app_item_tablet.dart';

class MainAppList extends StatelessWidget {
  const MainAppList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MainAppModel>>(
      future: context.read<MainContentState>().getLoadMainAppModels,
      builder: (BuildContext context, AsyncSnapshot<List<MainAppModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: context.read<MainContentState>().getMainApps.length,
            itemBuilder: (BuildContext context, int index) {
              final MainAppModel mainAppModel = snapshot.data![index];
              return ScreenTypeLayout.builder(
                mobile: (BuildContext context) =>
                    MainAppItemPhone(item: mainAppModel),
                tablet: (BuildContext context) =>
                    MainAppItemTablet(item: mainAppModel),
                desktop: (BuildContext context) =>
                    MainAppItemDesktop(item: mainAppModel),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainPadding,
              child: SelectableText(
                '${snapshot.error}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
