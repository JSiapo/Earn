import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatelessWidget with BasePage {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getclearAppBar(context, actions: [
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.trashCan),
            tooltip: "LIMPIAR"),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.solidBellSlash),
            // icon: const FaIcon(FontAwesomeIcons.solidBell),
            tooltip: "SILENCIAR"),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: List.generate(3, (index) => index)
              .map((e) => ItemNotifation(
                  id: e,
                  icon: e == 0 ? 'paperPlane' : 'creditCard',
                  title: e == 0
                      ? 'Solicitud de Compartir tarjeta'
                      : 'Se realizó una transferencia',
                  subtitle: e == 0
                      ? 'Lili desea que compartas tu tarjeta, por favor realiza la configuración'
                      : 'A la cuenta BCP cuenta de ahorros en soles'))
              .toList(),
        ),
      ),
    );
  }
}

class ItemNotifation extends StatelessWidget {
  final int id;
  final String icon;
  final String title;
  final String subtitle;
  const ItemNotifation({
    Key? key,
    required this.id,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: FaIcon(getIcon(icon)),
      title: Text(title),
      subtitle: Text(subtitle),
      isThreeLine: true,
      selected: id == 0,
    );
  }
}
