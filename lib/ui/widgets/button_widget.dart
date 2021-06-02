import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? border;
  final double? padding;
  final VoidCallback? onPressed;
  FontWeight? fontWeight;
  ButtonWidget({
    @required this.onPressed,
    this.padding,
    this.border,
    @required this.text,
    this.color,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
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
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
