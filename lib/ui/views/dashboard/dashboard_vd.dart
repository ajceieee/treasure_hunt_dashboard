import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/dashboard_vm.dart';
import 'package:flutter_boiler_plate/ui/views/dashboard/top_players.dart';
import 'package:flutter_boiler_plate/ui/widgets/all_users.dart';
import 'package:flutter_boiler_plate/ui/widgets/search_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import '../../responsive.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Leaderboard",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // PlayerDetails(),
                            SizedBox(height: 16.0),
                            if (Responsive.isMobile(context))
                              Column(
                                children: [
                                  TopPlayers(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Responsive(
                                    mobile: UserCardGridView(),
                                    tablet: UserCardGridView(),
                                    desktop: UserCardGridView(),
                                  ),
                                ],
                              ),
                            SizedBox(height: 16.0),
                            AllPlayers(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context)) SizedBox(width: 16.0),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              TopPlayers(),
                              SizedBox(
                                height: 20,
                              ),
                              Responsive(
                                mobile: UserCardGridView(),
                                tablet: UserCardGridView(),
                                desktop: UserCardGridView(),
                              ),
                            ],
                          ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "All Players",
              style: Theme.of(context).textTheme.subtitle1,
            ),
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
                          child: Responsive.isMobile(context)
                              ? FittedBox(
                                  fit: BoxFit.contain,
                                  child: DataTable(
                                    horizontalMargin: 0,
                                    columnSpacing: 16.0,
                                    columns: [
                                      DataColumn(
                                        label: Text("Rank"),
                                      ),
                                      DataColumn(
                                        label: Text("Name"),
                                      ),
                                      DataColumn(
                                        label: Text("Score"),
                                      ),
                                    ],
                                    rows: List.generate(
                                      model.searchList!.length,
                                      (index) => userDetailsRow(
                                          onTap: () {},
                                          name: model.searchList![index]!.name,
                                          level: model.searchList![index]!.rank,
                                          total: model
                                              .searchList![index]!.totalScore,
                                          context: context),
                                    ),
                                  ),
                                )
                              : DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: 16.0,
                                  columns: [
                                    DataColumn(
                                      label: Text("Rank"),
                                    ),
                                    DataColumn(
                                      label: Text("Name"),
                                    ),
                                    DataColumn(
                                      label: Text("Score"),
                                    ),
                                  ],
                                  rows: List.generate(
                                    model.searchList!.length,
                                    (index) => userDetailsRow(
                                        onTap: () {},
                                        name: model.searchList![index]!.name,
                                        level: model.searchList![index]!.rank,
                                        total: model
                                            .searchList![index]!.totalScore,
                                        context: context),
                                  ),
                                ),
                        ),
        ],
      ),
    );
  }
}

class UserCardGridView extends StatelessWidget {
  const UserCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) => UserInfoCard(info: demoMyFiles[index]),
    );
  }
}

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Total PLayers",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "1.9GB",
    color: Color(0xFF212332),
    percentage: 35,
  ),
];

class UserInfoCard extends ViewModelWidget<DashboardViewModel> {
  const UserInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final CloudStorageInfo info;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // ProgressLine(
          //   color: info.color,
          //   percentage: info.percentage,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              model.userLoading
                  ? Container()
                  : Text(
                      "${model.quaruntimePlayers!.length} players",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white70),
                    ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = const Color(0xFF212332),
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
