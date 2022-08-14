import 'package:eran_by_saving/provider/card_provider.dart';
import 'package:eran_by_saving/provider/operations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => CardProvider()),
    ChangeNotifierProvider(create: (_) => OperationProvider()),
  ].toList();
}

Future<void> start(BuildContext context) async {
  await Future.wait([
    context.read<HomeProvider>().loadSetting(),
    context.read<CardProvider>().getAll(),
    context.read<OperationProvider>().getAll(),
  ]);
  // await context.read<HomeProvider>().loadSetting();
  // await context.read<CardProvider>().getAll();
  // await context.read<OperationProvider>().getAll();
}
