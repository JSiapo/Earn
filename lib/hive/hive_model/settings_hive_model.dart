import 'package:hive_flutter/adapters.dart';

part 'settings_hive_model.g.dart';

@HiveType(typeId: 0)
class SettingsHive extends HiveObject {
  @HiveField(0, defaultValue: true)
  final bool isDark;

  SettingsHive({required this.isDark});
}
