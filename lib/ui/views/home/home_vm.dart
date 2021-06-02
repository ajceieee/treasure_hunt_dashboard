import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreenVM extends BaseViewModel {
  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  
  void logout() async {
    try {
      await _authService.signOut();
      _navigationService.clearStackAndShow(Routes.loginView);
    } catch (e) {
      _easyLoadingService.showToast(FAILED_LOGOUT);
    }
  }
}
