// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:the_first/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String? lab;
  final IconData? icon;
  final TextEditingController? myController;
  final TextInputType? keytyp;
  Function(String?)? onClick;
  CustomTextField({
    Key? key,
    required this.hint,
    this.lab,
    required this.icon,
    this.myController,
    this.keytyp,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: myController,
        // ignore: missing_return
        validator: (value) {
          if (value!.isEmpty) {
            return 'الرجاء ملىء الحقل';
          }
          return null;
        },
        onSaved: onClick,
        keyboardType: keytyp,
        textAlign: TextAlign.end,

        style: TextStyle(fontSize: 15),
        cursorColor: kPrColor,

        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kPrColor),
          filled: true,
          labelText: lab,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          fillColor: kbiColor.withOpacity(.6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: kPrColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
