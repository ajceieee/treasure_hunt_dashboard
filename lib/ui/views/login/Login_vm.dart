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

class LoginVM extends BaseViewModel {
  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  NavigationService _navigationService = locator<NavigationService>();
  UserService _service = locator<UserService>();

  bool _signInBtnState = false;

  bool get signInBtnState => _signInBtnState;

  void setSignInStatus(bool value) {
    _signInBtnState = value;
    notifyListeners();
  }

  void onPressed() async {
    try {
      setSignInStatus(true);
      UserCredential? credential = await _authService.signInWithGoogle();
      if (credential != null) {
        User? user = credential.user;
        if (user != null) {
          UserModel? userDetails = await _service.getUserDetails(user.uid);
          if (userDetails != null)
            navigateTo(Routes.homeScreenV);
          else {
            await _authService.signOut();
            navigateTo(Routes.loginView);
          }
        } else
          _easyLoadingService.showToast(FAIL_MSG);
      } else
        _easyLoadingService.showToast(FAIL_MSG);
    } catch (e, s) {
      _easyLoadingService.showToast(e.toString());
    }
    setSignInStatus(false);
  }

  void navigateTo(String route) {
    _navigationService.clearStackAndShow(
      route,
    );
  }
}
