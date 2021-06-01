import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/login/Login_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:stacked/stacked.dart';

class LoginViewDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            elevation: 0,
          ),
          body: Center(
            child: AppCard1(
              child: Column(
                children: [
                  Text(
                    "LOGIN",

                  ),
                ],
              ),
              key: Key("login_card"),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginVM(),
    );
  }
}
