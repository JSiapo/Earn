import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:eran_by_saving/constants.dart';
import 'package:eran_by_saving/hive_config.dart' show initHive, getSettings;
import 'package:eran_by_saving/provider_config.dart' show providers;

import 'package:eran_by_saving/route/routes.dart'
    show routeByPlatform, appRoutes;
import 'package:eran_by_saving/provider/home_provider.dart';

Future<void> main() async {
  await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: const MaterialWithTheme(),
    );
  }
}

class MaterialWithTheme extends StatelessWidget {
  const MaterialWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getSettings(context),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return Consumer<HomeProvider>(
            builder: (context, data, _) => MaterialApp(
              title: 'Earn By Saving',
              debugShowCheckedModeBanner: false,
              theme:
                  data.settings.isDark ? ThemeData.dark() : ThemeData.light(),
              initialRoute: routeByPlatform(PAGES.homePage.route),
              routes: appRoutes,
            ),
          );
        }
        return MaterialApp(
          title: 'Earn By Saving',
          theme: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                      .platformBrightness ==
                  Brightness.dark
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const Scaffold(
            body: Center(
              child: Text('Descifrando datos ...'),
            ),
          ),
        );
      },
    );
  }
}
