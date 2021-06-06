import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/dashboard_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/search_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                APP_NAME,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 5,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All Users",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SearchBarWidget(
                    onChanged: model!.filterUsersList,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  model.userLoading
                      ? (Container(
                    width: double.infinity,
                    child: Center(
                      child: SpinKitThreeBounce(
                        size: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ))
                      : model.searchList!.isEmpty
                      ? Container(
                    width: double.infinity,
                    child: Center(child: Text("No Active Players")),
                  )
                      : model.userDetails == null
                      ? Container(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                            "Something went wrong please try again")),
                  )
                      : Container(
                    width: double.infinity,
                    child: DataTable(
                      horizontalMargin: 0,
                      columnSpacing: 16.0,
                      columns: [
                        DataColumn(
                          label: Text("Name"),
                        ),
                        DataColumn(
                          label: Text("Level"),
                        ),
                      ],
                      rows: List.generate(
                        model.searchList!.length,
                            (index) => userDetailsRow(
                            name: model.searchList![index]!.fullName,
                            level: model
                                .searchList![index]!.highestLevelPlayed,
                            context: context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => DashboardViewModel());
  }
}
