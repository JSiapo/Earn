import 'dart:math' as math;
import 'package:flutter/material.dart';

class Responsive {
  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _orientation = MediaQuery.of(context).orientation;
    _width = size.width;
    _height = size.height;

    // c2+ a2+b2 => c = srt(a2+b2)
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    _isMobile = size.shortestSide < 600;
    _isTablet = size.shortestSide >= 600 && size.shortestSide < 1200;
    _isDesktop = size.shortestSide >= 1200;
  }

  double _width = 0, _height = 0, _diagonal = 0;
  bool _isTablet = false, _isDesktop = false, _isMobile = false;
  Orientation _orientation = Orientation.portrait;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  bool get isTablet => _isTablet;
  bool get isDesktop => _isDesktop;
  bool get isMobile => _isMobile;
  Orientation get orientation => _orientation;

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
