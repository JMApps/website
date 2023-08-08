import 'package:flutter/material.dart';
import 'package:website/domain/main_app_bloc.dart';
import 'package:website/presentation/items/main_app_item.dart';
import 'package:website/presentation/model/main_app_model.dart';

class MainAppList extends StatelessWidget {
  final MainAppBloc mainAppBloc;

  const MainAppList({super.key, required this.mainAppBloc});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MainAppModel>>(
      future: mainAppBloc.getLoadMainAppModels,
      builder: (BuildContext context, AsyncSnapshot<List<MainAppModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: mainAppBloc.getMainApps.length,
            itemBuilder: (BuildContext context, int index) {
              final MainAppModel mainAppModel = snapshot.data![index];
              return MainAppItem(item: mainAppModel);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Произошла ошибка ${snapshot.error}',
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
