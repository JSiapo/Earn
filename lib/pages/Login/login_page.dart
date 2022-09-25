import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:eran_by_saving/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Consumer<HomeProvider>(builder: (context, data, _) {
          return Scaffold(
            backgroundColor: data.settings.isDark
                ? const Color.fromARGB(255, 244, 185, 68)
                : const Color.fromARGB(255, 252, 241, 78),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Center(
                          child: SvgPicture.asset(
                              'assets/images/icons/undraw_mobile_pay_re_sjb8.svg',
                              height: responsive.hp(70),
                              semanticsLabel: 'Login Logo'),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(mainAxisSize: MainAxisSize.max, children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                        onPressed: () {
                          goTo(context, PAGES.homePage.route);
                        },
                        // color: Theme.of(context).backgroundColor,
                        color:
                            data.settings.isDark ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getIconWidget(
                                IconsAvailables.google,
                                color: data.settings.isDark
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Text('Inicia sesión con Google',
                                  style: TextStyle(
                                    color: data.settings.isDark
                                        ? Colors.black
                                        : Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ],
            ),
          );
        }),
      ),
    );
  }
}
