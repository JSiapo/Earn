// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:eran_by_saving/pages/Home/home_page.dart';
import 'package:eran_by_saving/pages/Home/home_page_android.dart';

// only Android iOS and web
String routeByPlatform(String route) {
  if (kIsWeb) return route;
  if (Platform.isAndroid) return '${route}_android';
  if (Platform.isIOS) return '${route}_ios';
  return route;
}

void goTo(BuildContext context, String route) {
  Navigator.pushNamed(context, routeByPlatform(route));
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/home': (BuildContext _) => const HomePage(),
  '/home_android': (BuildContext _) => const HomePageAndroid(),
  '/home_ios': (BuildContext _) => const HomePage()
};
