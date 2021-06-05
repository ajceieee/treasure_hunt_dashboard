import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? border;
  final double? padding;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double? borderSide;

  FontWeight? fontWeight;
  ButtonWidget({
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
        child: Text(
          text ?? "",
          style: TextStyle(
            fontFamily: "Poppins-Regular",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
