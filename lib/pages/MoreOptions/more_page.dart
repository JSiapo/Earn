import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreOptionsPage extends StatelessWidget with BasePage {
  const MoreOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: getclearAppBar(context),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: responsive.isLandscape ? 3 : 2),
        children: [
          CardOption(
              action: () => {},
              icon: getIconWidget(IconsAvailables.chart),
              title: "Estadisticas"),
          CardOption(
              action: () => {},
              icon: getIconWidget(IconsAvailables.group),
              title: "Categorías"),
          CardOption(
              action: () => {},
              icon: getIconWidget(IconsAvailables.coins),
              title: "Intereses"),
          CardOption(
              action: () => {},
              icon: getIconWidget(IconsAvailables.calculator),
              title: "Calculadora"),
          CardOption(
              action: () => {},
              icon: getIconWidget(IconsAvailables.calendar),
              title: "Calendario"),
          CardOption(
              action: () => {},
              icon: getIconWidget(IconsAvailables.user),
              title: "Acerca de"),
        ],
      ),
    );
  }
}

class CardOption extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function action;
  const CardOption(
      {Key? key, required this.icon, required this.title, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            // goTo(context, route);
            action();
          },
          child: Tooltip(
            message: title,
            child: Card(
              elevation: 5,
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
                      child: icon,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        title,
                        style: GoogleFonts.lato(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
