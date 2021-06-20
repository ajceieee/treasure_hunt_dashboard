import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/ui/media/themes.dart';
import 'package:flutter_boiler_plate/ui/widgets/dialog/set_up_dialog.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'app/app.router.dart';
import 'constants/strings.dart';
import 'services/third_party/easyloading/easyloading.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await ThemeManager.initialise();
    await setupLocator();
    setUpDialogUi();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
    };
    await SentryFlutter.init(
      (options) {
        options.dsn =
            '';
      },
      appRunner: () => runApp(MyApp()),
    );
  }, reportError);
}

void reportError(Object error, StackTrace stackTrace) async {
  print("Error while initializing app n $error");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.dark,
      darkTheme: AppTheme().darkTheme,
      lightTheme: AppTheme().lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => Portal(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: APP_NAME,
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            builder: locator<EasyLoadingService>().initialize(
              builder: (BuildContext context, Widget? child) {
                Widget error = Text('..');
                if (child is Scaffold || child is Navigator)
                  error = Scaffold(body: Center(child: error));
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  print(errorDetails.context);
                  print(errorDetails.exception);
                  print(errorDetails.library);
                  return error;
                };
                return child!;
              },
            )),
      ),
    );
  }
}
