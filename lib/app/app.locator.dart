// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/local_storage/shared_prefs.dart';
import '../services/logger/logger.dart';
import '../services/third_party/easyloading/easyloading.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LoggerService());
  locator.registerLazySingleton(() => EasyLoadingService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  final sharedPrefsService = await SharedPrefsService.getInstance();
  locator.registerSingleton(sharedPrefsService);
}
