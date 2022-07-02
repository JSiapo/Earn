import 'package:eran_by_saving/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdaptativeButton extends StatelessWidget {
  final String text;
  final void Function() callback;
  const AdaptativeButton({Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (platformUI == PLATFORMS.android) {
      return AdaptativeButtonAndroid(callback: callback, text: text);
    }
    if (platformUI == PLATFORMS.ios) {
      return AdaptativeButtonIOS(callback: callback, text: text);
    }
    if (platformUI == PLATFORMS.web) {
      return AdaptativeButtonAndroid(callback: callback, text: text);
    }
    return AdaptativeButtonAndroid(callback: callback, text: text);
  }
}

class AdaptativeButtonAndroid extends StatelessWidget {
  final String text;
  final void Function() callback;
  const AdaptativeButtonAndroid(
      {Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: GoogleFonts.lato(),
          ),
        ],
      ),
    );
  }
}

class AdaptativeButtonIOS extends StatelessWidget {
  final String text;
  final void Function() callback;
  const AdaptativeButtonIOS(
      {Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: callback,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: GoogleFonts.lato(),
          ),
        ],
      ),
    );
  }
}
