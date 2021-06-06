import 'package:flutter_boiler_plate/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_boiler_plate/app/app.locator.dart';

class MainSplashVM extends FutureViewModel<bool> {
  NavigationService _navigationService = locator<NavigationService>();

  @override
  Future<bool> futureToRun() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  @override
  void onData(bool? data) {
    if (data == true) {
      _navigationService.clearStackAndShow(Routes.dashBoard);
    }
    super.onData(data);
  }
}
