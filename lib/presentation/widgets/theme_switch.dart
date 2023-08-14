import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/domain/state/main_state.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainState>(
      builder: (context, mainState, _) {
        return Switch(
          value: mainState.getDarkThemeState,
          trackColor: MaterialStateProperty.all(Colors.grey),
          thumbColor: MaterialStateProperty.all(mainState.getMainColor.withOpacity(0.50)),
          onChanged: (bool? onChanged) {
            mainState.setDarkThemeState = onChanged!;
          },
        );
      },
    );
  }
}
