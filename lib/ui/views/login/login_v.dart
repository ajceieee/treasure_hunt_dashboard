import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/login/login_vd.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (context) => LoginViewDesktop(),
        desktop: (context) => LoginViewDesktop());
  }
}
