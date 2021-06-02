import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/network/api_services/user_service.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreenVM extends BaseViewModel {
  String get title => HOME_TITLE;
  String get updateVTitle => QUARUNTIME;

  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  UserApiService _userApiService = locator<UserApiService>();
  NavigationService _navigationService = locator<NavigationService>();

  final _formKey = GlobalKey<FormState>();

  HomeScreenVM() {
    _nameValue = _authService.currentUser!.displayName;
    _emailValue = _authService.currentUser!.email;
  }

  bool _buttonState = false;
  String? _nameValue;
  String? _emailValue;
  String? _uCode;

  set nameValue(name) {
    _nameValue = name;
  }

  set emailValue(email) {
    _emailValue = email;
  }

  set uCode(uCode) {
    _uCode = uCode;
  }

  set changeButtonState(bool state) {
    _buttonState = state;
    notifyListeners();
  }

  String? get name => _nameValue;
  String? get email => _emailValue;
  String? get userCode => _uCode;
  bool get buttonState => _buttonState;

  get formKey => _formKey;

  void onPressed() async {
    if (_formKey.currentState!.validate()) {
      UserModel user = UserModel(
        email: _emailValue,
        fullName: _nameValue,
        uId: _authService.currentUser?.uid,
        uCode: _uCode,
      );
      try {
        bool isUpdated = await _userApiService.postUserDetails(user);
        if (isUpdated)
          _navigationService.clearTillFirstAndShow(Routes.homeScreenV);
        else
          _easyLoadingService.showToast(ERROR_UPDATE);
      } catch (e) {
        _easyLoadingService.showToast(ERROR_UPDATE);
        log("Error: while updating user details \n $e");
      }
    }
  }
}
