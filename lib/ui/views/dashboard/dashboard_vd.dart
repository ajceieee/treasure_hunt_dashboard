import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/dashboard_vm.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/player_details.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/top_players.dart';
import 'package:flutter_boiler_plate/ui/widgets/all_users.dart';
import 'package:flutter_boiler_plate/ui/widgets/position_user.dart';
import 'package:flutter_boiler_plate/ui/widgets/search_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import '../../responsive.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              APP_NAME,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Theme.of(context).accentColor,
            elevation: 5,
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              model.initialise();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            PlayerDetails(),
                            SizedBox(height: 16.0),
                            if (Responsive.isMobile(context)) TopPlayers(),
                            SizedBox(height: 16.0),
                            AllPlayers(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context)) SizedBox(width: 16.0),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: TopPlayers(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}

class AllPlayers extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text(
            "All Players",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20.0,
          ),
          SearchBarWidget(
            onChanged: model.filterUsersList,
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
                      child: Center(child: Text(model.errorString)),
                    )
                  : model.quaruntimePlayers == null
                      ? Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              model.errorString,
                            ),
                          ),
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
                                label: Text("Rank"),
                              ),
                            ],
                            rows: List.generate(
                              model.searchList!.length,
                              (index) => userDetailsRow(
                                  name: model.searchList![index]!.name,
                                  level: model.searchList![index]!.rank,
                                  context: context),
                            ),
                          ),
                        ),
        ],
      ),
    );
  }
}
