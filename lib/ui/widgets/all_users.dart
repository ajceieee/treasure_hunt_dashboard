import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/responsive.dart';
import 'package:flutter_boiler_plate/ui/views/home/home_vm.dart';
import 'package:flutter_boiler_plate/ui/widgets/search_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class AllUsers extends ViewModelWidget<HomeScreenVM> {
  const AllUsers({
    Key? key,
  }) : super(key: key);

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
            "All Users",
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
                      child: Center(child: Text("No Active Players")),
                    )
                  : model.userDetails == null
                      ? Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Something went wrong please try again",
                            ),
                          ),
                        )
                      : Responsive.isMobile(context)
                          ? Container(
                              width: double.infinity,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: 3.0,
                                  columns: [
                                    DataColumn(
                                      label: Text("Level"),
                                    ),
                                    DataColumn(
                                      label: Text("Name"),
                                    ),
                                    DataColumn(
                                      label: Text("Time"),
                                    ),
                                  ],
                                  rows: List.generate(
                                    model.searchList!.length,
                                    (index) => userDetailsRow(
                                        model: model,
                                        onTap: () {
                                          model
                                              .onTap(model.searchList![index]!);
                                        },
                                        date: model.searchList![index]
                                            ?.lastAnsweredTime,
                                        name:
                                            model.searchList![index]!.fullName,
                                        level: model.searchList![index]!
                                            .highestLevelPlayed
                                            .toString(),
                                        context: context,
                                        index: index),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              child: DataTable(
                                horizontalMargin: 0,
                                columnSpacing: 3.0,
                                columns: [
                                  DataColumn(
                                    label: Text("Level"),
                                  ),
                                  DataColumn(
                                    label: Text("Name"),
                                  ),
                                  DataColumn(
                                    label: Text("Time"),
                                  ),
                                ],
                                rows: List.generate(
                                  model.searchList!.length,
                                  (index) => userDetailsRow(
                                      model: model,
                                      onTap: () {
                                        model.onTap(model.searchList![index]!);
                                      },
                                      date: model
                                          .searchList![index]?.lastAnsweredTime,
                                      name: model.searchList![index]!.fullName,
                                      level: model.searchList![index]!
                                          .highestLevelPlayed
                                          .toString(),
                                      context: context,
                                      index: index),
                                ),
                              ),
                            ),
        ],
      ),
    );
  }
}

DataRow userDetailsRow({
  String? name,
  String? date,
  String? level,
  String? time,
  context,
  int? index,
  HomeScreenVM? model,
  required Function onTap,
}) {
  return DataRow(
    cells: [
      DataCell(
        Text("$level "),
      ),
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              "assets/User Icon.svg",
              height: 15,
              width: 15,
            ),
            SizedBox(
              width: 10.0,
            ),
            if (Responsive.isMobile(context))
              SizedBox(
                width: name!.length > 25 ? 100 : 200,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (Responsive.isDesktop(context) | Responsive.isTablet(context))
              Text(
                name ?? " ",
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        onTap: () => onTap.call(),
      ),
      DataCell(
        Text("${model!.getFormatedDate(date)}"),
      ),
    ],
  );
}
