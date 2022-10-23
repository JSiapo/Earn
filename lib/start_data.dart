import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/provider_config.dart';
import 'package:flutter/material.dart';

Future<PAGES> startData(BuildContext context) async {
  try {
    return start(context);
  } catch (e) {
    return PAGES.loginPage;
  }
}
