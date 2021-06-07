import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/models/quauntime_player.dart';
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
    double dialogHeight = MediaQuery.of(context).size.height / 2;
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Text((request.customData as Result).name ?? ""),
                  SizedBox(
                    height: 10.0,
                  ),
                  Chip(
                    label: Text(
                      "Rank ${(request.customData as Result).rank ?? ""}",
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  DetailRow(
                    name: "Quiz",
                    value: (request.customData as Result).quiz,
                  ),
                  DetailRow(
                    name: "Word Search",
                    value: (request.customData as Result).wordSearch,
                  ),
                  DetailRow(
                    name: "Cryptography",
                    value: (request.customData as Result).cryptography,
                  ),
                  DetailRow(
                    name: "Crossword",
                    value: (request.customData as Result).crossword,
                  ),
                  DetailRow(
                    name: "Aptitude Test",
                    value: (request.customData as Result).aptitudeTest,
                  ),
                  DetailRow(
                    name: "Treasure Hunt",
                    value: (request.customData as Result).treasureHunt,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  String? name;
  String? value;
  DetailRow({this.value, this.name});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name ?? "",
          textAlign: TextAlign.left,
        ),
        Text(
          value ?? "0",
        ),
      ],
    );
  }
}
