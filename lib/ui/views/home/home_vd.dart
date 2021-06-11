import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/ui/views/home/top_players.dart';
import 'package:flutter_boiler_plate/ui/widgets/all_users.dart';
import 'package:flutter_boiler_plate/ui/widgets/profile_card.dart';

import 'package:flutter_portal/flutter_portal.dart';
import 'package:stacked/stacked.dart';
import '../../responsive.dart';
import 'home_vm.dart';

class HomeScreenV extends StatelessWidget {
  const HomeScreenV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenVM>.reactive(
      builder: (context, model, child) => Scaffold(
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
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          actions: [
            VerticalOption(),
          ],
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              model.initialise();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                                ],
                              ),
                            SizedBox(height: 16.0),
                            AllUsers(),
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context)) SizedBox(width: 16.0),
                      if (!Responsive.isMobile(context))
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              TopPlayers(),
                              SizedBox(
                                height: 20,
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
        ),
      ),
      viewModelBuilder: () => HomeScreenVM(),
    );
  }
}

class VerticalOption extends ViewModelWidget<HomeScreenVM> {
  @override
  Widget build(BuildContext context, HomeScreenVM model) {
    return PortalEntry(
      visible: model.getPortalState,
      portal: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: model.changePortalState,
      ),
      child: PortalEntry(
        visible: model.getPortalState,
        portalAnchor: Alignment.topRight,
        childAnchor: Alignment.bottomCenter,
        portal: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: Offset(0, 5),
                blurRadius: 15,
                spreadRadius: 0.3,
              )
            ],
          ),
          padding: EdgeInsets.all(15),
          width: 180,
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              model.isBusy
                  ? ImageIcon(
                      AssetImage("assets/User Icon.png"),
                      color: Theme.of(context).primaryColor,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                        model.userName!.photoURL!,
                      ),
                      radius: 20,
                    ),
              InkWell(
                child: Center(
                  child: Text(
                    "${model.userName?.displayName ?? " "}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: model.logout,
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        child: ProfileCard(
          onTap: model.changePortalState,
          name: model.userName?.displayName ?? "",
        ),
      ),
    );
    ;
  }
}
