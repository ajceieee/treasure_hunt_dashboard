import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/crash_analytics/firebase_crash_analytics.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:stacked/stacked.dart';

class LoginVM extends BaseViewModel {
  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();

  bool _signInBtnState = false;

  bool get signInBtnState => _signInBtnState;

  void setSignInStatus(bool value){
    _signInBtnState = value;
    notifyListeners();
  }

  void onPressed() async {
    try {
      setSignInStatus(true);
      UserCredential? credential = await _authService.signInWithGoogle();
      if (credential?.user != null){
        User? user = credential?.user;
        print(user?.getIdToken());
        print(_authService.currentUser);
      }
      else
        _easyLoadingService.showToast("Cancelled");
      setSignInStatus(false);
    } catch (e) {}
  }
}
