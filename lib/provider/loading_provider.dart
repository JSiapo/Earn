import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool isLoading = false;

  setLoading(bool value) {
    print('is loading antes $isLoading');
    isLoading = value;
    print('is loading luego $isLoading');
    notifyListeners();
  }
}
