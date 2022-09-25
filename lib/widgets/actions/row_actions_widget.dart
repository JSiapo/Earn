import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/widgets/actions/action_widget.dart';
import 'package:flutter/material.dart';

class ListActionsWidget extends StatelessWidget {
  const ListActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: actions(),
    );
  }
}

List<Widget> actions() {
  return [
    ActionWidget(
        route: PAGES.transferPage.route,
        icon: getIconWidget(IconsAvailables.arrowsRotate),
        text: "Transferir"),
    ActionWidget(
        route: PAGES.payPage.route,
        icon: getIconWidget(IconsAvailables.receipt),
        text: "Pagar servicio"),
    ActionWidget(
        route: PAGES.receivePage.route,
        icon: getIconWidget(IconsAvailables.coins),
        text: "Recibir"),
    ActionWidget(
        route: PAGES.settingsPage.route,
        icon: getIconWidget(IconsAvailables.ellipsis),
        text: "Más"),
  ];
}
