import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:flutter_boiler_plate/services/user_service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenVM extends FutureViewModel<bool> {
  final NavigationService _navigationService = locator<NavigationService>();
  final EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  UserService _service = locator<UserService>();

  String get title => SPLASH_TITLE;

  @override
  Future<bool> futureToRun() async => await runSplashService();

  Future<bool> runSplashService() async {
    await Future.delayed(Duration(seconds: 1));
    User? user = _authService.currentUser;
    if (user == null) {
      user = await _authService.authStateChanges.first;
    }
    if (user != null) return true;
    return false;
  }

  @override
  void onData(bool? data) async {
    if (data == true) {
      try {
        UserModel? user =
            await _service.getUserDetails(_authService.currentUser?.uid);
        if (user != null)
          navigateTo(Routes.homeScreenV);
        else {
          await _authService.signOut();
          navigateTo(Routes.loginView);
        }
      } catch (e) {
        _easyLoadingService.showToast(ERROR_RETRY);
      }
    } else
      navigateTo(Routes.loginView);
    super.onData(data);
  }

  void navigateTo(String route) {
    _navigationService.clearStackAndShow(
      route,
    );
  }

  @override
  void onError(error) {
    print("error => $error");
    _easyLoadingService.showToast(ERROR_RETRY);
    initialise();
    super.onError(error);
  }
}
