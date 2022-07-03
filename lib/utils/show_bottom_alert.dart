import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,
    {Function? callback, String action = "Action"}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    action: callback != null
        ? SnackBarAction(
            label: action,
            onPressed: () {
              callback();
            },
          )
        : null,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
