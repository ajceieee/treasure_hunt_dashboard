import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/config/flavor/flavor.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app/app.locator.dart';
import 'constants/urls.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: FlavorTypes.DEV,
    values: FlavorData(baseUrl: BASE_URL_DEV),
  );

  // await Firebase.initializeApp();
  await ThemeManager.initialise();
  await setupLocator();

  runZonedGuarded(() {
    runApp(MyApp());
  }, reportError);
}

void reportError(Object error, StackTrace stackTrace) async {
  // TODO: Report Crash
  debugPrint(
      '(ERROR) main.dart:main. error: ${error.toString()} stack-trace: ${stackTrace.toString()}');
}