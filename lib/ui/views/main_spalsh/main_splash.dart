import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/ui/views/splash/splash_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:stacked/stacked.dart';

import 'main_splash_vm.dart';

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainSplashVM>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Container(
            child: Center(
              child: Container(
                child: Text(
                  APP_NAME,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MainSplashVM(),
    );
  }
}
