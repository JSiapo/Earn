import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DevicePlatform {
  bool isWindows = false;
  bool isAndroid = false;
  bool isIOS = false;
  bool isLinux = false;
  bool isMacOS = false;
  bool isWeb = false;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  DevicePlatform() {
    getDevicePlatform();
  }

  void getDevicePlatform() {
    isWindows = Platform.isWindows;
    isAndroid = Platform.isAndroid;
    isIOS = Platform.isIOS;
    isLinux = Platform.isLinux;
    isMacOS = Platform.isMacOS;
    isWeb = kIsWeb;
  }

  Future<String> getDeviceDetail() async {
    if (isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return ' ${androidInfo.manufacturer} ${androidInfo.model}';
    }

    if (isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return '${iosInfo.utsname.machine}';
    }

    if (isWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return '${webBrowserInfo.userAgent}';
    }
    return '';
  }

  Future<String> getDeviceID() async {
    return '${await PlatformDeviceId.getDeviceId}';
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    // String version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;
    return packageInfo.version;
  }

  Future<String> getDeviceVersion() async {
    if (isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return ' ${androidInfo.version.release}';
    }

    if (isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return '${iosInfo.systemVersion}';
    }

    if (isWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return '${webBrowserInfo.userAgent}';
    }

    return '';
  }
}
