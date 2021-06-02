import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/widgets/button_widget.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:stacked/stacked.dart';

import 'home_vm.dart';

class HomeViewD extends StatelessWidget {
  const HomeViewD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenVM>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          actions: [
            ButtonWidget(
              color: Colors.black,
              onPressed: model.logout,
              text: "Logout",
            ),
          ],
        ),
        body: Center(
          child: AppCard1(
            key: Key("card_home"),
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .2,
              child: Center(
                child: Container(
                  child: Text("Home Title"),
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeScreenVM(),
    );
  }
}
