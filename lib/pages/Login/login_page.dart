import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget with BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            MaterialButton(
              onPressed: () {
                goTo(context, PAGES.homePage.route);
              },
              child: const Text('Login with Google'),
            )
          ]),
        ),
      ),
    );
  }
}
