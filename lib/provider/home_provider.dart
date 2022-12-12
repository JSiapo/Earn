import 'package:eran_by_saving/constants/page_constant.dart';
import 'package:flutter/material.dart';

import 'package:eran_by_saving/hive/hive_data/settings_data.dart';
import 'package:eran_by_saving/model/settings_model.dart';

class HomeProvider extends ChangeNotifier {
  Settings settings = const Settings(isDark: true);
  int indexPage = 0;

  Future<Settings> getSettings() async {
    const settingData = SettingsData();
    return await settingData.getSetting();
  }

  Future<void> saveSettings() async {
    const settingData = SettingsData();
    await settingData.save(settings);
  }

  Future<void> toogleTheme() async {
    settings = settings.copy(isDark: !settings.isDark);
    await saveSettings();
    notifyListeners();
  }

  Future<void> setTheme(bool isDark) async {
    settings = Settings(isDark: isDark);
    await saveSettings();
    notifyListeners();
  }

  Future<void> setSetting(Settings settings) async {
    this.settings = settings;
    await saveSettings();
    notifyListeners();
  }

  Future<void> loadSetting() async {
    settings = await getSettings();
    notifyListeners();
  }

  void updatePage() {}
}
