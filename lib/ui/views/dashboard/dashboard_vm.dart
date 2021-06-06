import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/services/third_party/easyloading/easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final EasyLoadingService _easyLoadingService = locator<EasyLoadingService>();
  // void filterUsers(List<Data?>? usersList, {required bool initialLoad}) {
  //   if (!initialLoad) {
  //     if (usersList!.isEmpty) {
  //       _errorString = "Oops, Unable to find";
  //     }
  //   }
  //   _searchList!.clear();
  //   _searchList!.addAll(usersList!);
  //   notifyListeners();
  // }
  //
  // void filterUsersList(String name) {
  //   if (name.isEmpty) {
  //     filterUsers(
  //       _usersData,
  //       initialLoad: false,
  //     );
  //   } else {
  //     List<Data> users = [];
  //     _usersData!.forEach((e) {
  //       if (e!.fullName!.toLowerCase().contains(name.toLowerCase())) {
  //         users.add(e);
  //       }
  //     });
  //     filterUsers(
  //       users,
  //       initialLoad: false,
  //     );
  //   }
  // }

  void navigateTo(String route) {
    _navigationService.clearTillFirstAndShow(
      route,
    );
  }
}
