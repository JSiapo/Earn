import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:eran_by_saving/hive/hive_model/settings_hive_model.dart';
import 'package:eran_by_saving/provider_config.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsHiveAdapter());
}

Future<bool> getSettings(BuildContext context) async {
  try {
    await loadFromLocal(context);
    return true;
  } catch (e) {
    return false;
  }
}
