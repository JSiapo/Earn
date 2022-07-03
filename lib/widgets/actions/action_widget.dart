import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActionWidget extends StatelessWidget {
  final String route;
  final String text;
  final IconData icon;
  const ActionWidget(
      {Key? key, required this.icon, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return GestureDetector(
        onTap: () {
          goTo(context, route);
        },
        //icon: FaIcon(icon)
        child: GestureDetector(
          onTap: () {
            goTo(context, route);
          },
          child: Tooltip(
            message: text,
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.wp(5),
                  horizontal: responsive.wp(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: FaIcon(icon),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
