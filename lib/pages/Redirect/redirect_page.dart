import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/Decrypt/descpryt_page.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/start_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      startData(context).then((success) {
        context
            .read<HomeProvider>()
            .setTheme(context.read<HomeProvider>().settings.isDark);
        goTo(context, success.route, replace: true);
      }).onError((error, stackTrace) {
        context.read<ErrorProvider>().isRedirectPage = true;
        context.read<ErrorProvider>().redirectErrorPage = PAGES.redirectPage;
        context
            .read<ErrorProvider>()
            .addError("$error", redirectPage: PAGES.redirectPage);
        goTo(context, PAGES.errorPage.route);
      });
    } catch (e) {
      context.read<ErrorProvider>().isRedirectPage = true;
      context.read<ErrorProvider>().redirectErrorPage = PAGES.redirectPage;
      context
          .read<ErrorProvider>()
          .addError("$e", redirectPage: PAGES.redirectPage);
      goTo(context, PAGES.errorPage.route);
    }

    return const DecryptPage();
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
