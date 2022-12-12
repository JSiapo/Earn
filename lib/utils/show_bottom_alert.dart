import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MessageType {
  error,
  info,
  warning,
}

Color? getBackgroundColor(MessageType type) {
  switch (type) {
    case MessageType.error:
      return Colors.red;
    default:
      return null;
  }
}

Color? getContentColor(MessageType type) {
  switch (type) {
    case MessageType.error:
      return Colors.white;
    default:
      return null;
  }
}

void showSnackBar(BuildContext context, String message,
    {Function? callback, String action = "Action", type = MessageType.info}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: getBackgroundColor(type),
    content: Text(
      message,
      style: GoogleFonts.montserrat(color: getContentColor(type)),
    ),
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
