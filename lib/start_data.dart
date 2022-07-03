import 'package:eran_by_saving/provider_config.dart';
import 'package:flutter/material.dart';

Future<bool> startData(BuildContext context) async {
  try {
    await start(context);
    return true;
  } catch (e) {
    return false;
  }
}
