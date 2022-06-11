//? https://stackoverflow.com/a/55119208 -- https://stackoverflow.com/questions/51791501/how-to-debounce-textfield-onchange-in-dart
import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
