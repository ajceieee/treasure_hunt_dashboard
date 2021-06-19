import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/views/home/home_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/position_infocard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class TopPlayers extends ViewModelWidget<HomeScreenVM> {
  @override
  Widget build(BuildContext context, HomeScreenVM model) {
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
            "Players Level",
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
              : model.groupList == null
                  ? Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "${model.errorString}",
                      )),
                    )
                  : model.groupList!.isEmpty
                      ? Container(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "${model.errorString}",
                          )),
                        )
                      : ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            if (model.groupList != null)
                              for (var k in model.groupList!.keys)
                                PositionInfoCard(
                                  svgSrc: "assets/User Icon.svg",
                                  title: "Level " + k.toString(),
                                  rank:
                                      "${model.groupList![k] != null ? model.groupList![k]!.length : 0} players",
                                  numOfFiles: 1328,
                                ),
                          ],
                        )
        ],
      ),
    );
  }
}
