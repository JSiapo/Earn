import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/error_provider.dart';
import 'package:eran_by_saving/provider/loading_provider.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:eran_by_saving/provider/success_provider.dart';
import 'package:eran_by_saving/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => ErrorProvider()),
    ChangeNotifierProvider(create: (_) => SuccessProvider()),
    ChangeNotifierProvider(create: (_) => CardProvider()),
    ChangeNotifierProvider(create: (_) => OperationProvider()),
    ChangeNotifierProvider(create: (_) => LoadingProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ].toList();
}

Future<PAGES> start(BuildContext context) async {
  try {
    await context.read<HomeProvider>().loadSetting();
    await context.read<UserProvider>().loadUser();
    var user = await context.read<UserProvider>().getUser();
    if (user != null) {
      await loadOperations(context);
      return PAGES.homePage;
    }
  } catch (e) {
    rethrow;
  }

  return PAGES.loginPage;

  // await context.read<HomeProvider>().loadSetting();
  // await context.read<CardProvider>().getAll();
  // await context.read<OperationProvider>().getAll();
}

Future<void> loadOperations(BuildContext context) async {
  try {
    await Future.wait([
      context.read<CardProvider>().getAll(),
      context.read<OperationProvider>().getAll(),
    ]);
  } catch (e) {
    rethrow;
  }
}
