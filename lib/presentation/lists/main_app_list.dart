import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/application/strings/app_strings.dart';
import 'package:website/domain/main_app_bloc.dart';
import 'package:website/presentation/desktop/main_app_item_desktop.dart';
import 'package:website/presentation/model/main_app_model.dart';
import 'package:website/presentation/phone/main_app_item_phone.dart';
import 'package:website/presentation/tablet/main_app_item_tablet.dart';

class MainAppList extends StatelessWidget {
  final MainAppBloc mainAppBloc;

  const MainAppList({super.key, required this.mainAppBloc});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MainAppModel>>(
      future: mainAppBloc.getLoadMainAppModels,
      builder:
          (BuildContext context, AsyncSnapshot<List<MainAppModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: mainAppBloc.getMainApps.length,
            itemBuilder: (BuildContext context, int index) {
              final MainAppModel mainAppModel = snapshot.data![index];
              return ScreenTypeLayout.builder(
                mobile: (BuildContext context) => MainAppItemPhone(item: mainAppModel),
                tablet: (BuildContext context) => MainAppItemTablet(item: mainAppModel),
                desktop: (BuildContext context) => MainAppItemDesktop(item: mainAppModel),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '${AppStrings.errorMessage} ${snapshot.error}',
              style: const TextStyle(fontSize: 35),
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
