import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/home/home_vd.dart';
import 'package:flutter_boiler_plate/ui/views/splash/splash_vd.dart';
import 'package:responsive_builder/responsive_builder.dart';


class HomeScreenV extends StatelessWidget {
  const HomeScreenV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) => HomeViewD(),
      mobile: (BuildContext context) => HomeViewD(),
    );
  }
}
