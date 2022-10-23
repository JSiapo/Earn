import 'package:eran_by_saving/hive/hive_model/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eran_by_saving/hive/hive_model/settings_hive_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsHiveAdapter());
  Hive.registerAdapter(UserHiveAdapter());
}
