import 'package:eran_by_saving/utils/debouncer.dart';
import 'package:flutter/material.dart';

import 'package:eran_by_saving/hive/hive_data/settings_data.dart';
import 'package:eran_by_saving/model/settings_model.dart';

class HomeProvider extends ChangeNotifier {
  late Settings settings;
  int indexPage = 0;
  int indexCard = 0;
  final _debouncer = Debouncer(milliseconds: 1200);

  Future<Settings> getSettings() async {
    const settingData = SettingsData();
    return await settingData.getSetting();
  }

  Future<void> saveSettings() async {
    const settingData = SettingsData();
    settingData.save(settings);
  }

  Future<void> toogleTheme() async {
    settings = settings.copy(isDark: !settings.isDark);
    await saveSettings();
    notifyListeners();
  }

  Future<void> setSetting(Settings settings) async {
    this.settings = settings;
    notifyListeners();
  }

  Future<void> loadSetting() async {
    settings = await getSettings();
    notifyListeners();
  }

  Future<void> cardChanged(int page, double? pageControllerPage) async {
    _debouncer.run(() {
      indexCard = page;
      notifyListeners();
    });
  }

  void updatePage() {}
}
