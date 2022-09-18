// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:eran_by_saving/constants.dart';
import 'package:eran_by_saving/pages/Card/AddCard/add_card_page.dart';
import 'package:eran_by_saving/pages/Card/card_page.dart';
import 'package:eran_by_saving/pages/Decrypt/descpryt_page.dart';
import 'package:eran_by_saving/pages/Login/login_page.dart';
import 'package:eran_by_saving/pages/Notifications/notification_page.dart';
import 'package:eran_by_saving/pages/PayService/pay_service_page.dart';
import 'package:eran_by_saving/pages/Receipt/receipt_page.dart';
import 'package:eran_by_saving/pages/Receive/receive_page.dart';
import 'package:eran_by_saving/pages/Redirect/redirect_page.dart';
import 'package:eran_by_saving/pages/Settings/settings_page.dart';
import 'package:eran_by_saving/pages/Transfer/transfer_page.dart';
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

void goTo(BuildContext context, String route, {bool replace = false}) {
  if (replace)
    Navigator.pushReplacementNamed(context, routeByPlatform(route));
  else
    Navigator.pushNamed(context, routeByPlatform(route));
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/home': (BuildContext _) => const HomePage(),
  '/home_android': (BuildContext _) => const HomePageAndroid(),
  '/home_ios': (BuildContext _) => const HomePage(),
  '/settings': (BuildContext _) => const SettingsPage(),
  '/settings_android': (BuildContext _) => const SettingsPage(),
  '/settings_ios': (BuildContext _) => const SettingsPage(),
  '/decrpyt': (BuildContext _) => const DecryptPage(),
  '/decrpyt_android': (BuildContext _) => const DecryptPage(),
  '/decrpyt_ios': (BuildContext _) => const DecryptPage(),
  '/card': (BuildContext _) => const CardPage(),
  '/card_android': (BuildContext _) => const CardPage(),
  '/card_ios': (BuildContext _) => const CardPage(),
  '/addcard': (BuildContext _) => const AddCardPage(),
  '/addcard_android': (BuildContext _) => const AddCardPage(),
  '/addcard_ios': (BuildContext _) => const AddCardPage(),
  '/receipt_ios': (BuildContext _) => const ReceiptPage(),
  '/receipt_android': (BuildContext _) => const ReceiptPage(),
  '/receive_ios': (BuildContext _) => const ReceivePage(),
  '/receive_android': (BuildContext _) => const ReceivePage(),
  '/transfer_ios': (BuildContext _) => const TransferPage(),
  '/transfer_android': (BuildContext _) => const TransferPage(),
  '/pay_ios': (BuildContext _) => const PayServicePage(),
  '/pay_android': (BuildContext _) => const PayServicePage(),
  '/login_ios': (BuildContext _) => const LoginPage(),
  '/login_android': (BuildContext _) => const LoginPage(),
  '/redirect_ios': (BuildContext _) => const RedirectPage(),
  '/redirect_android': (BuildContext _) => const RedirectPage(),
  '/notification_ios': (BuildContext _) => const NotificationPage(),
  '/notification_android': (BuildContext _) => const NotificationPage(),
};
