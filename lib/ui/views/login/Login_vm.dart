import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/crash_analytics/firebase_crash_analytics.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:flutter_boiler_plate/ui/views/update/update_v.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginVM extends BaseViewModel {
  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  NavigationService _navigationService = locator<NavigationService>();

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
        _navigationService.replaceWithTransition(
          UpdateScreenV(),
          duration: Duration(seconds: 1),
          transition: NavigationTransition.DownToUp,
        );
      } else
        _easyLoadingService.showToast(FAIL_MSG);
      setSignInStatus(false);
    } catch (e, s) {
      _easyLoadingService.showToast(FAIL_MSG);
    }
  }
}
