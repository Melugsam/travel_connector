import 'package:flutter/material.dart';

import 'features/app/presentation/app.dart';
import 'core/injector/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(
  //   widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  // );

  await init();

  runApp(const App());
  // FlutterNativeSplash.remove();
}
