import 'package:eran_by_saving/hive/hive_model/settings_hive_model.dart';

import '../../model/settings_model.dart';

extension ToSettingsParse on SettingsHive {
  Settings toSettings() {
    return Settings(isDark: isDark);
  }
}

extension ToSettingsHiveParse on Settings {
  SettingsHive toSettingsHive() {
    return SettingsHive(isDark: isDark);
  }
}

extension ToSettingsListParse on List<SettingsHive> {
  List<Settings> toListSettings() {
    final List<Settings> listOfSettings = [];

    for (var setting in this) {
      listOfSettings.add(setting.toSettings());
    }

    return listOfSettings;
  }
}

extension ToSettingsHiveListParse on List<Settings> {
  List<SettingsHive> toListSettingsHive() {
    final List<SettingsHive> listOfSettingsHive = [];

    for (var setting in this) {
      listOfSettingsHive.add(setting.toSettingsHive());
    }

    return listOfSettingsHive;
  }
}
