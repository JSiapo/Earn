import 'package:eran_by_saving/pages/Home/home_page_abstract.dart';
import 'package:flutter/material.dart';
import 'package:eran_by_saving/pages/Home/home_page.dart';

class HomePageAndroid extends HomePage with HomePageAbstract {
  const HomePageAndroid({Key? key}) : super(key: key);

  @override
  String setTitle() {
    return "HomeAndroid";
  }
}
