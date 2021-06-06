import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/dashboard_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/position_infocard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class TopPlayers extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Players",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.0),
          model.userLoading
              ? Center(
                  child: SpinKitThreeBounce(
                    size: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : model.quaruntimePlayers == null
                  ? Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "${model.errorString}",
                      )),
                    )
                  : model.quaruntimePlayers!.isEmpty
                      ? Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "${model.errorString}",
                          )),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return PositionInfoCard(
                              svgSrc: "assets/User Icon.svg",
                              title:
                                  " ${model.quaruntimePlayers![index]!.name}",
                              rank: " ${model.quaruntimePlayers![index]!.rank}",
                              numOfFiles: 1328,
                            );
                          })
        ],
      ),
    );
  }
}
