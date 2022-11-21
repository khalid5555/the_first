// ignore_for_file: camel_case_types, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class myContainer extends StatelessWidget {
  Color clr;
  Widget child;
  double hi;
  double wi;
  double radius;

  myContainer({
    Key? key,
    required this.clr,
    required this.child,
    required this.hi,
    required this.wi,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hi,
      width: wi,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
