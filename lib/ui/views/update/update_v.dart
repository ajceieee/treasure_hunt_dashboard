import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/widgets/card.dart';
import 'package:flutter_boiler_plate/ui/widgets/text_field_widget.dart';
import 'package:stacked/stacked.dart';

import 'update_vm.dart';

class UpdateScreenV extends StatelessWidget {
  const UpdateScreenV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenVM>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text("Quaruntime"),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: AppCard1(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your Details",
                  ),
                  TextFieldWidget(
                    initialValue: model.name ?? "",
                    onChanged: (value) {},
                    labelText: "Name",
                    validator: (value) {},
                    hintText: "name",
                  ),
                  TextFieldWidget(
                    initialValue: model.email ?? "",
                    onChanged: (value) {},
                    labelText: "Email",
                    validator: (value) {},
                    hintText: "Email",
                  ),
                  TextFieldWidget(
                    onChanged: (value) {},
                    labelText: "Code",
                    validator: (value) {},
                    hintText: "Code",
                  )
                ],
              ),
              key: Key("home_card"),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeScreenVM(),
    );
  }
}
