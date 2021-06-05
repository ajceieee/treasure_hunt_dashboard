import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    this.name,
    required this.onTap,
    Key? key,
  }) : super(key: key);

 final VoidCallback onTap;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 10.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0 / 2,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/User Icon.png",
              height: 38,
            ),
            if (!Responsive.isMobile(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
                child: Text(name ?? ""),
              ),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
