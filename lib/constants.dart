import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuDrawer {
  final String title;
  final IconData icon;
  final int index;

  const MenuDrawer(this.title, this.icon, this.index);
}

enum PLATFORMS { android, ios, web, adaptive }

PLATFORMS getPlatform({PLATFORMS? defaultPlatform}) {
  if (defaultPlatform != null) return defaultPlatform;
  if (kIsWeb) return PLATFORMS.web;
  if (Platform.isAndroid) return PLATFORMS.android;
  if (Platform.isIOS) return PLATFORMS.ios;
  return PLATFORMS.adaptive;
}

final platformUI = getPlatform(defaultPlatform: PLATFORMS.ios);
final platform = getPlatform();
