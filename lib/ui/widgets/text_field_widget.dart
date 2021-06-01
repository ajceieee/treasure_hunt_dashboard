
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) validator;
  final bool? obScureText;
  final Widget? suffixIcon;
  final bool? enabled;
  TextInputType? keyboardType;
  String? initialValue;

  TextFieldWidget({
    this.initialValue,
    this.keyboardType,
    this.obScureText,
    this.controller,
    this.suffixIcon,
    this.enabled,
    required this.onChanged,
    required this.labelText,
    required this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 1),
              color: Colors.grey.withOpacity(0.1),
            )
          ],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: TextFormField(
          onChanged: (value) => onChanged(value),
          initialValue: initialValue,
          keyboardType: keyboardType ?? TextInputType.text,
          enabled: enabled ?? true,
          obscureText: obScureText ?? false,
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon ?? null,
            fillColor: Colors.white,
            filled: true,
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins-Regular',
              fontSize: 16,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Poppins-Regular',
            ),
            //floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}