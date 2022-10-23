import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/firebase_config.dart';
// import 'package:eran_by_saving/start_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:eran_by_saving/constants.dart';
import 'package:eran_by_saving/hive_config.dart' show initHive;
import 'package:eran_by_saving/provider_config.dart' show providers;

import 'package:eran_by_saving/route/routes.dart'
    show routeByPlatform, transitionRoutes;
import 'package:eran_by_saving/provider/home_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await initFirebase();
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
    return Consumer<HomeProvider>(
      builder: (context, data, _) => MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        title: 'Earn By Saving',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android:
                  FadeUpwardsPageTransitionsBuilder(), // Apply this to every platforms you need.
            },
          ),
          useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(255, 232, 251, 30),
          scaffoldBackgroundColor:
              data.settings.isDark ? Colors.grey[850] : Colors.grey[50],
          brightness: data.settings.isDark ? Brightness.dark : Brightness.light,
          // : MediaQueryData.fromWindow(
          //         WidgetsBinding.instance.window)
          //     .platformBrightness,
        ),
        initialRoute: routeByPlatform(PAGES.redirectPage.route),
        // routes: appRoutes,
        onGenerateRoute: transitionRoutes,
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
