import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:flutter/material.dart';

class SuccessProvider extends ChangeNotifier {
  List<String> messages = [];
  PAGES redirectSuccess = PAGES.homePage;
  bool isRedirectPage = false;
  bool isBack = false;

  void addMessage(String message,
      {PAGES? redirectPage, bool isBackPage = false}) {
    messages.add(message);
    if (redirectPage != null) {
      isRedirectPage = true;
      redirectSuccess = redirectPage;
      isBack = isBackPage;
    }
    notifyListeners();
  }

  void reset() {
    messages.clear();
    isRedirectPage = false;
    redirectSuccess = PAGES.homePage;
    isBack = false;
    notifyListeners();
  }
}
