import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/models/all_user.dart';
import 'package:flutter_boiler_plate/services/auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/services/network/api_services/user_service.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:flutter_boiler_plate/services/user_service/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreenVM extends FutureViewModel<bool> {
  FirebaseAuthService _authService = locator<FirebaseAuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  UserApiService _userApiService = locator<UserApiService>();

  User? _user;
  bool _showPortal = false;
  List<Data?>? _usersData;
  bool _usersLoading = true;
  List<Data?>? _searchList = [];
  String _errorString = "";

  User? get userName => _user;
  bool get getPortalState => _showPortal;
  List<Data?>? get userDetails => _usersData;
  bool get userLoading => _usersLoading;
  List<Data?>? get searchList => _searchList;
  String get errorString => _errorString;

  set setUserLoading(bool isLoading) {
    _usersLoading = isLoading;
    notifyListeners();
  }

  set setUser(User? name) {
    _user = name;
    notifyListeners();
  }

  set setPortalState(bool isShowPortal) {
    _showPortal = isShowPortal;
    notifyListeners();
  }

  set setUsersData(List<Data> usersData) {
    _usersData = usersData;
    notifyListeners();
  }

  void changePortalState() {
    if (_showPortal)
      setPortalState = false;
    else
      setPortalState = true;
  }

  @override
  Future<bool> futureToRun() async {
    User? user = await _authService.authStateChanges.first;
    if (user != null) {
      setUser = user;
      return true;
    } else {
      return false;
    }
  }

  @override
  void onData(bool? data) async {
    if (data == true) {
      setUserLoading = true;
      await getUsers();
      setUserLoading = false;
    } else {
      _navigationService.clearStackAndShow(Routes.splashScreenV);
    }
    super.onData(data);
  }

  @override
  Future<bool> getUsers() async {
    bool isFetched = false;
    try {
      AllUser? userDetails = await _userApiService.getAllUsers();
      if (userDetails?.status != 200)
        isFetched = false;
      else {
        if (userDetails?.data != null) {
          if (userDetails!.data!.isNotEmpty) {
            setUsersData = userDetails.data!;
            isFetched = true;
          } else {
            setUsersData = [];
            isFetched = false;
          }
        } else {
          setUsersData = [];
          isFetched = false;
        }
      }
    } catch (e) {
      isFetched = false;
    }

    filterUsers(_usersData, initialLoad: true);
    return isFetched;
  }

  void filterUsers(List<Data?>? usersList, {required bool initialLoad}) {
    if (!initialLoad) {
      if (usersList!.isEmpty) {
        _errorString = "Oops, Unable to find";
      }
    }
    _searchList!.clear();
    _searchList!.addAll(usersList!);
    notifyListeners();
  }

  void filterUsersList(String name) {
    if (name.isEmpty) {
      filterUsers(
        _usersData,
        initialLoad: false,
      );
    } else {
      List<Data> users = [];
      _usersData!.forEach((e) {
        if (e!.fullName!.toLowerCase().contains(name.toLowerCase())) {
          users.add(e);
        }
      });
      filterUsers(
        users,
        initialLoad: false,
      );
    }
  }

  void logout() async {
    try {
      await _authService.signOut();
      _navigationService.clearStackAndShow(Routes.loginView);
    } catch (e) {
      _easyLoadingService.showToast(FAILED_LOGOUT);
    }
  }
}
