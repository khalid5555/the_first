// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';

showDialogAll(context, String myTitle, String myContent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(myTitle),
          content: Text(myContent),
          actions: <Widget>[
            TextButton(
              child: Text("Done"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

showLoading(context, bool des) {
  return showDialog(
    useRootNavigator: des,
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Text("الرجاء الانتظار ")),
        content: Container(
          height: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
