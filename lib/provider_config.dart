import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:eran_by_saving/provider/home_provider.dart';

List<SingleChildWidget> providers() {
  return [ChangeNotifierProvider(create: (_) => HomeProvider())].toList();
}

Future<void> loadFromLocal(BuildContext context) async {
  await context.read<HomeProvider>().loadSetting();
}