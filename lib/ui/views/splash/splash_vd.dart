import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/splash/splash_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:stacked/stacked.dart';

class SplashScreenVD extends StatelessWidget {
  const SplashScreenVD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenVM>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .2,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(  "assets/cs.png")
                  )
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SplashScreenVM(),
    );
  }
}
