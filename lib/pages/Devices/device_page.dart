import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> with BasePage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getclearAppBar(context, title: "DISPOSITIVOS"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: const Text(
                'Aqui tienes todos tus dispositivos en lo que has iniciado sesión, puedes cerrar sesión en los dispositivos que eligas.',
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: const Text(
                'En caso de encontrar dispositivos que no reconoces haber iniciado sesión, cierra sesión. Al usar una cuenta de Google, te recomendamos usar el doble factor de autenticación.',
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Opacity(
                  opacity: 0.6,
                  child: Text(
                    'DISPOSITIVO ACTUAL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: const Text('Xiaomi Redmi Note 8'),
                subtitle: const Text('Trujillo, La Libertad, Perú'),
                isThreeLine: true,
                leading: getIconWidget(IconsAvailables.mobileScreen),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Opacity(
                  opacity: 0.6,
                  child: Text(
                    'OTROS DISPOSITIVOS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
            ),
            ...[
              "Realme 8",
              "Nexus 7",
              "Realme 8",
              "Nexus 7",
              "Realme 8",
              "Nexus 6"
            ]
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: ListTile(
                      title: Text(e),
                      subtitle: const Text(
                          'Trujillo, La Libertad, Perú (hace 7 días)'),
                      isThreeLine: false,
                      leading: getIconWidget(IconsAvailables.mobileScreen),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
