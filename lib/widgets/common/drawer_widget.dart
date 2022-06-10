import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_zoom_drawer/config.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;
  final Widget menu;
  const CustomDrawer({required this.child, required this.menu, Key? key})
      : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void dispose() {
    super.dispose();
  }

//!ZoomDrawer not working in Web
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: widget.menu,
      mainScreen: widget.child,
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      drawerShadowsBackgroundColor: Colors.grey,
      mainScreenTapClose: true,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
