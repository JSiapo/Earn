import 'package:flutter/material.dart';

void confirmDialog(BuildContext context, Function yes, Function no,
    {String title = "Mensaje", String message = ""}) {
  var alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      MaterialButton(
          onPressed: () {
            yes();
          },
          child: const Text('SI')),
      MaterialButton(
          onPressed: () {
            no();
          },
          child: const Text('NO')),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
