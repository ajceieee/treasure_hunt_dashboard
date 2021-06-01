import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/login/Login_vm.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) {
        return Center(
          child: Container(
            height: 100,
            color: Colors.red,
            child: Text("hello"),
          ),
        );
      },
      viewModelBuilder: () => LoginVM(),
    );
  }
}
