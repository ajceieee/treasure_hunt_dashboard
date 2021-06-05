import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/ui/media/color.dart';

class AppCard1 extends StatelessWidget {
  final Widget child;

  AppCard1({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.appSilver.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
