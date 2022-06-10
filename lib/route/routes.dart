// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:eran_by_saving/constants.dart';
import 'package:flutter/material.dart';

import 'package:eran_by_saving/pages/Home/home_page.dart';
import 'package:eran_by_saving/pages/Home/home_page_android.dart';

// only Android iOS and web
String routeByPlatform(String route) {
  if (platform == PLATFORMS.web) return route;
  if (platform == PLATFORMS.android) return '${route}_android';
  if (platform == PLATFORMS.ios) return '${route}_ios';
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
