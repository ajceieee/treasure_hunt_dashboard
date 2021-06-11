import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/ui/views/login/Login_vm.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:stacked/stacked.dart';

class LoginViewDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginVM>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    APP_NAME + " Treasure Hunt Leaderboard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  !model.signInBtnState
                      ? SignInButton(
                          Buttons.Google,
                          onPressed: model.onPressed,
                        )
                      : CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginVM(),
    );
  }
}
