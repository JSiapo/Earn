import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:flutter/material.dart';

class ErrorProvider extends ChangeNotifier {
  List<String> errors = [];
  PAGES redirectErrorPage = PAGES.homePage;
  bool isRedirectPage = false;
  bool isBack = false;

  void addError(String error, {PAGES? redirectPage, bool isBackPage = false}) {
    errors.add(error);
    if (redirectPage != null) {
      isRedirectPage = true;
      redirectErrorPage = redirectPage;
      isBack = isBackPage;
    }
    notifyListeners();
  }

  void reset() {
    errors.clear();
    isRedirectPage = false;
    redirectErrorPage = PAGES.homePage;
    isBack = false;
    notifyListeners();
  }
}
