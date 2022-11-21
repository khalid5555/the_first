// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final String? lab;
  final bool obscureText;
  final Color? color;

  final IconData? icon;
  final TextEditingController? myController;
  final TextInputType? keytyp;
  Function(String?)? onClick;
  AppTextField({
    Key? key,
    required this.hint,
    this.lab,
    this.obscureText = false,
    this.color = AppColors.kWhite,
    required this.icon,
    this.myController,
    this.keytyp,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      cursorColor: AppColors.kbiColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.kPrColor),
        filled: true,
        labelText: lab,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14,
          color: color,
        ),
        fillColor: Colors.white.withOpacity(.4),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.kPrColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
