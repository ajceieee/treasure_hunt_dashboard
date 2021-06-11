import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/models/all_user.dart';
import 'package:flutter_boiler_plate/models/quauntime_player.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  DetailsDialog({
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    print((request.customData as Data).answers);
    double dialogHeight = MediaQuery.of(context).size.height * .8;
    double dialogWidth = MediaQuery.of(context).size.width / 2;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: dialogWidth,
        height: dialogHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).backgroundColor,
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dialogWidth / 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Theme.of(context).accentColor,
                    child: ImageIcon(
                      AssetImage(
                        "assets/User Icon.png",
                      ),
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text((request.customData as Data).fullName ?? ""),
                  SizedBox(
                    height: 10.0,
                  ),
                  Chip(
                    label: Text(
                      "Level ${(request.customData as Data).highestLevelPlayed ?? ""}",
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DetailRow(
                    name: "Email",
                    value: "${(request.customData as Data).email ?? ""}",
                  ),
                  if ((request.customData as Data).answers != null)
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: (request.customData as Data).answers!.length,
                        itemBuilder: (context, index) {
                          return DetailRow(
                            name: getFormatedDate((request.customData as Data)
                                    .answers![index]
                                    ?.time) ??
                                "",
                            value: (request.customData as Data)
                                    .answers![index]!
                                    .answer ??
                                "",
                          );
                        })
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  String? getFormatedDate(String? date) {
    if (date == null) return "";
    DateTime tempDate = new DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date, true);
    final dateNew = tempDate.toLocal();
    final _format = DateFormat.jms();
    return _format.format(dateNew);
  }
}

class DetailRow extends StatelessWidget {
  String? name;
  String? value;
  DetailRow({
    this.value,
    this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name ?? "",
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: Text(
            value ?? "0",
          ),
        ),
      ],
    );
  }
}
