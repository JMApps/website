import 'package:flutter/material.dart';
import 'package:website/presentation/pages/root_page.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const RootPage(),
  );
}
