import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/splash/splash_vd.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'splash_vm.dart';

class SplashScreenV extends StatelessWidget {
  const SplashScreenV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => SplashScreenVD(),
      mobile: (BuildContext context) => SplashScreenVD(),
    );
  }
}
