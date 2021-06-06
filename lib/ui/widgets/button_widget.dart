import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? border;
  final double? padding;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double? borderSide;
  final bool? showIcon;
  FontWeight? fontWeight;
  ButtonWidget({
    this.showIcon,
    this.textColor,
    this.borderSide,
    this.text,
    this.color,
    this.border,
    this.padding,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: borderSide ?? 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(border ?? 0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon!
                ? Image(
                    image: AssetImage("assets/google.png"),
                    width: 20,
                    height: 20,
                    color: Theme.of(context).primaryColor,
                  )
                : SizedBox(),
            Text(
              text ?? "",
              style: TextStyle(
                fontFamily: "Poppins-Regular",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
