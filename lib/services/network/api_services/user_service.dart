import 'dart:developer';

import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/constants/urls.dart';
import 'package:flutter_boiler_plate/models/all_user.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/services/network/api_service.dart';

abstract class UserSer {
  Future<bool> postUserDetails(UserModel userModel);

  Future<UserModel?>? getUserDetails(String uuId);

  Future<AllUser?>? getAllUsers();
}

class UserApiService extends UserSer {
  ApiService _apiService = locator<ApiService>();

  @override
  Future<bool> postUserDetails(UserModel userModel) async {
    try {
      final response = await _apiService.post(
        USER_POST,
        data: userModel.toPostJson(),
      );
      if (response['message'] == "OK")
        return true;
      else
        return false;
    } catch (e) {
      log("Error: Failed to post User Data \n $e");
      return false;
    }
  }

  @override
  Future<UserModel?>? getUserDetails(String? uuId) async {
    try {
      final response = await _apiService.get(USER_GET + "/$uuId");
      if (response['message'] == "Ok")
        return UserModel.fromJson(response["result"]);
      else
        return null;
    } catch (e) {
      log("Error: Failed to get User Data \n $e");
      return null;
    }
  }

  @override
  Future<AllUser?>? getAllUsers() async {
    try {
      final response = await _apiService.get(USER_GET);
      if (response['message'] == "OK")
        return AllUser.fromJson(response);
      else
        return null;
    } catch (e) {
      log("Error: Failed to get User Data \n $e");
      return null;
    }
  }
}
