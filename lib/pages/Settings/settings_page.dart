import 'package:cached_network_image/cached_network_image.dart';
import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/provider/user_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/confirm_dialog.dart';
import 'package:eran_by_saving/utils/device.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/google_login.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget with BasePage {
  const SettingsPage({Key? key}) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://jsiapo.dev/'))) {
      throw 'Could not launch https://jsiapo.dev/';
    }
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    DevicePlatform dp = DevicePlatform();
    return Scaffold(
      appBar: getclearAppBar(context),
      body: Consumer<HomeProvider>(
        builder: (context, data, _) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Center(
                child: Hero(
                  tag: 'profile',
                  child: CachedNetworkImage(
                    fit: BoxFit.scaleDown,
                    imageUrl: context.read<UserProvider>().user?.image ?? "",
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      // radius: responsive.wp(7),
                      maxRadius: responsive.isLandscape
                          ? responsive.wp(7)
                          : responsive.wp(16),
                      minRadius: responsive.wp(5),
                      backgroundColor: Theme.of(context).cardColor,
                      // radius: responsive.wp(16),
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) => CircleAvatar(
                      radius: responsive.wp(7),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: IconButton(
                        // color: Colors.white,
                        visualDensity: VisualDensity.comfortable,
                        iconSize: responsive.wp(7),
                        onPressed: () {},
                        icon: getIconWidget(IconsAvailables.user),
                      ),
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: responsive.wp(7),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: IconButton(
                        // color: Colors.white,
                        visualDensity: VisualDensity.comfortable,
                        iconSize: responsive.wp(6),
                        onPressed: () {},
                        icon: getIconWidget(IconsAvailables.user),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsive.hp(4)),
              // ListTile(
              //     onTap: () {
              //       goTo(context, PAGES.notificationPage.route);
              //     },
              //     title: const Text('Notificaciones'),
              //     trailing: const Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: CircleAvatar(
              //         child: Text(
              //           '1',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         backgroundColor: Colors.red,
              //         radius: 14,
              //       ),
              //     )),

              ListTile(
                onTap: () {
                  goTo(context, PAGES.notificationPage.route);
                },
                title: const Text('Notificaciones'),
                subtitle: const Text('1 notificación'),
                leading: getIconWidget(IconsAvailables.solidBell),
                trailing: getIconWidget(IconsAvailables.chevronRight),
              ),
              SizedBox(height: responsive.hp(1.3)),
              ListTile(
                onTap: () {
                  goTo(context, PAGES.devicePage.route);
                },
                title: const Text('Dispositivos'),
                subtitle: const Text('2 dispositivos conectados'),
                leading: getIconWidget(IconsAvailables.mobileScreen),
                trailing: getIconWidget(IconsAvailables.chevronRight),
              ),
              SizedBox(height: responsive.hp(1.3)),

              ListTile(
                onTap: () {},
                title: const Text('Solicitudes'),
                subtitle: const Text('Ninguna Pendiente'),
                leading: getIconWidget(IconsAvailables.shareNodes),
                trailing: getIconWidget(IconsAvailables.chevronRight),
              ),
              SizedBox(height: responsive.hp(1.3)),
              ListTile(
                onTap: () {
                  data.toogleTheme();
                },
                title: const Text('Apariencia'),
                subtitle: Text(data.settings.isDark ? 'OSCURO' : 'CLARO'),
                leading: getIconWidget(IconsAvailables.palette),
                trailing: getIconWidget(IconsAvailables.chevronRight),
              ),
              SizedBox(height: responsive.hp(1.3)),

              FutureBuilder<String>(
                  future: dp.getAppVersion(),
                  builder: (context, snapshot) {
                    return ListTile(
                      onTap: _launchUrl,
                      title: const Text('Novedades'),
                      subtitle: Text('Versión v${snapshot.data ?? ""}'),
                      leading: getIconWidget(IconsAvailables.circleInfo),
                      trailing: getIconWidget(IconsAvailables.chevronRight),
                    );
                  }),

              // SwitchListTile(
              //   value: data.settings.isDark,
              //   onChanged: (value) {
              //     data.toogleTheme();
              //   },
              //   title: const Text('Tema Oscuro'),
              // ),

              SizedBox(height: responsive.hp(1.3)),
              const Divider(),
              const Opacity(
                  opacity: 0.6,
                  child: Text(
                    'DISPOSITIVO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: responsive.hp(1.3)),

              FutureBuilder<String>(
                  future: dp.getDeviceDetail(),
                  builder: (context, snapshot) {
                    return ListTile(
                      onTap: () {},
                      title: const Text('Dispositivo'),
                      leading: getIconWidget(IconsAvailables.wrench),
                      trailing: Text(snapshot.data ?? ""),
                    );
                  }),
              SizedBox(height: responsive.hp(1.3)),

              FutureBuilder<String>(
                  future: dp.getDeviceVersion(),
                  builder: (context, snapshot) {
                    return ListTile(
                      onTap: () {},
                      title: const Text('OS'),
                      leading: getIconWidget(IconsAvailables.wrench),
                      trailing: Text(snapshot.data ?? ""),
                    );
                  }),
              SizedBox(height: responsive.hp(1.3)),
              FutureBuilder<String>(
                  future: dp.getDeviceID(),
                  builder: (context, snapshot) {
                    return ListTile(
                      onTap: () {},
                      title: const Text('ID'),
                      leading: getIconWidget(IconsAvailables.wrench),
                      trailing: Text(snapshot.data ?? ""),
                    );
                  }),
              SizedBox(height: responsive.hp(1.3)),
              const Divider(),
              ListTile(
                onTap: () {
                  confirmDialog(context, () async {
                    await handleLogout(
                        googleSignIn, context.read<UserProvider>());
                    goTo(context, PAGES.loginPage.route, replace: true);
                  }, () async {
                    Navigator.pop(context);
                  }, title: "SESIÓN", message: "¿Seguro desea cerrar sesión?");
                },
                title: const Text('Cerrar Sesión'),
                leading: getIconWidget(IconsAvailables.arrowRightFromBracket),
                trailing: getIconWidget(IconsAvailables.chevronRight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
