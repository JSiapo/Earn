import 'package:eran_by_saving/pages/Decrypt/descpryt_page.dart';
import 'package:eran_by_saving/pages/Error/error_page.dart';
import 'package:eran_by_saving/pages/Success/success_page.dart';
import 'package:eran_by_saving/pages/base.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/loading_provider.dart';
import 'package:eran_by_saving/provider/success_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BasePage {
  final Widget child;
  const LoginPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      Consumer<LoadingProvider>(builder: (context, data, _) {
        if (data.isLoading) return const DecryptPage();
        return Container();
      }),
      Consumer<ErrorProvider>(builder: (context, data, _) {
        if (data.errors.isNotEmpty) return const ErroPage();
        return Container();
      }),
      Consumer<SuccessProvider>(builder: (context, data, _) {
        if (data.messages.isNotEmpty) return const SuccessPage();
        return Container();
      }),
    ]);
  }
}
