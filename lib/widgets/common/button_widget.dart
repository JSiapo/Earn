import 'package:eran_by_saving/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final String text;
  final void Function() callback;
  const FancyButton({Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (platformUI == PLATFORMS.android) {
      return FancyButtonAndroid(callback: callback, text: text);
    }
    if (platformUI == PLATFORMS.ios) {
      return FancyButtonIOS(callback: callback, text: text);
    }
    if (platformUI == PLATFORMS.web) {
      return FancyButtonAndroid(callback: callback, text: text);
    }
    return FancyButtonAndroid(callback: callback, text: text);
  }
}

class FancyButtonAndroid extends StatelessWidget {
  final String text;
  final void Function() callback;
  const FancyButtonAndroid(
      {Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: callback, child: Text(text));
  }
}

class FancyButtonIOS extends StatelessWidget {
  final String text;
  final void Function() callback;
  const FancyButtonIOS({Key? key, required this.text, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(onPressed: callback, child: Text(text));
  }
}
