import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/application/colors/custom_colors.dart';
import 'package:website/application/styles/app_styles.dart';
import 'package:website/domain/app_bloc.dart';
import 'package:website/domain/state/main_state.dart';
import 'package:website/presentation/desktop/app_item.dart';
import 'package:website/presentation/desktop/app_model.dart';

class AppPages extends StatelessWidget {
  final AppBloc appBloc;

  const AppPages({super.key, required this.appBloc});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appBloc.getLoadApps,
      builder: (BuildContext context, AsyncSnapshot<List<AppModel>> snapshot) {
        if (snapshot.hasData) {
          return Consumer<MainState>(
            builder: (context, mainState, _) {
              return PageView.builder(
                controller: appBloc.getAppPageController,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final AppModel item = snapshot.data![index];
                  return AppItem(
                    item: item,
                    backgroundColor: mainState.getDarkThemeState
                        ? CustomColors.mainAppDarkColors[index]
                        : CustomColors.mainAppLightColors[index],
                    textColor: mainState.getDarkThemeState
                        ? CustomColors.mainAppLightColors[index]
                        : CustomColors.mainAppDarkColors[index],
                    count: appBloc.getApps.length,
                  );
                },
                onPageChanged: (int? pageIndex) {
                  mainState.getDarkThemeState
                      ? mainState.setMainColor = CustomColors.mainAppPrimaryDarkColors[pageIndex!]
                      : mainState.setMainColor = CustomColors.mainAppDarkColors[pageIndex!];
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainPadding,
              child: Text(
                snapshot.error.toString(),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
