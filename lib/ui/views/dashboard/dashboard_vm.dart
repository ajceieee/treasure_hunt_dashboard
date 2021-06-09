import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/models/quauntime_player.dart';
import 'package:flutter_boiler_plate/services/network/api_services/user_service.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:flutter_boiler_plate/ui/widgets/dialog/set_up_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends FutureViewModel<bool> {
  final UserApiService _userApiService = locator<UserApiService>();
  final DialogService _dialogService = locator<DialogService>();

  bool _showPortal = false;
  List<Result?>? _quaruntimePlayers;
  bool _usersLoading = true;
  List<Result?>? _searchList = [];
  String _errorString = "";

  bool get getPortalState => _showPortal;
  List<Result?>? get quaruntimePlayers => _quaruntimePlayers;
  bool get userLoading => _usersLoading;
  List<Result?>? get searchList => _searchList;
  String get errorString => _errorString;

  set setUserLoading(bool isLoading) {
    _usersLoading = isLoading;
    notifyListeners();
  }

  set setUsersData(List<Result?>? quaruntimePlayers) {
    _quaruntimePlayers = quaruntimePlayers;
    notifyListeners();
  }

  void onDetailsTap({Result? playerDetails}) async {
    DialogResponse? response = await _dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.details,
      customData: playerDetails,
    );

    if (response != null) {
      if (response.confirmed) {
        print("confirmed");
      }
    }
  }

  void filterUsers(List<Result?>? usersList, {required bool initialLoad}) {
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
        _quaruntimePlayers,
        initialLoad: false,
      );
    } else {
      List<Result> users = [];
      _quaruntimePlayers!.forEach((e) {
        if (e!.name!.toLowerCase().contains(name.toLowerCase())) {
          users.add(e);
        }
      });
      filterUsers(
        users,
        initialLoad: false,
      );
    }
  }

  @override
  Future<bool> futureToRun() async {
    setUserLoading = true;
    bool isLoaded = false;
    try {
      QuarauntimePlayer? players = await _userApiService.getCommonLeaderBoard();
      if (players != null) {
        if (players.status == 200) {
          if (players.result != null) {
            if (players.result!.isEmpty) {
              _errorString = "No Active Players";
              setUsersData = [];
            } else {
              setUsersData = players.result;
            }
            isLoaded = true;
          } else {
            setUsersData = null;
          }
        } else {
          _errorString = "Failed to Load\n Please try again";
          setUsersData = null;
        }
      } else {
        _errorString = "Failed to Load\n Please try again";
        setUsersData = null;
      }
    } catch (e) {
      _errorString = "Failed to Load\n Please try again";
      setUsersData = null;
    }
    setUserLoading = false;

    filterUsers(_quaruntimePlayers, initialLoad: true);
    return isLoaded;
  }

  @override
  void onError(error) {
    print(error);
    super.onError(error);
  }
}
