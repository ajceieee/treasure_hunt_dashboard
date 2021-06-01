import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:flutter_boiler_plate/ui/views/update/update_v.dart';
import 'package:flutter_boiler_plate/ui/views/login/login_v.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenVM extends FutureViewModel<bool> {
  // service class locators
  final NavigationService _navigationService = locator<NavigationService>();
  final EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();

  String get title => SPLASH_TITLE;

  @override
  Future<bool> futureToRun() async => await runSplashService();

  Future<bool> runSplashService() async {
    await Future.delayed(Duration(milliseconds: 2500));
    User? user = _authService.currentUser;
    if (user?.uid != null) return true;
    return false;
  }

  @override
  void onData(bool? data) async {
    print(data);
    if (data == true) {
      await Future.delayed(Duration(milliseconds: 5000));
      _navigationService.replaceWithTransition(
        UpdateScreenV(),
        duration: Duration(seconds: 1),
        transition: NavigationTransition.DownToUp,
      );
    } else {
      _navigationService.navigateWithTransition(
        LoginView(),
        duration: Duration(seconds: 1),
        transition: NavigationTransition.DownToUp,
      );
    }
    super.onData(data);
  }

  @override
  void onError(error) {
    _easyLoadingService.showToast(ERROR_RETRY);
    initialise();
    super.onError(error);
  }
}
