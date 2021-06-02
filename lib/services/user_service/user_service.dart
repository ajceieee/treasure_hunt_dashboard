import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/services/network/api_services/user_service.dart';

class UserService extends ChangeNotifier {
  UserApiService _userApiService = locator<UserApiService>();

  UserModel? _user;

  UserModel? get user => _user;

  set setUserModel(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<UserModel?>? getUserDetails(String? uuId) async {
    try {
      UserModel? user = await _userApiService.getUserDetails(uuId);
      if (user != null) {
        setUserModel = user;
        return user;
      }
      return null;
    } catch (e) {
      log("Error: while fetching user details in service");
    }
  }
}
