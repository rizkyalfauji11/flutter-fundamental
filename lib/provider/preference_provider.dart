import 'package:flutter/foundation.dart';
import 'package:flutter_fundamental/utils/preference_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailySchedulePreferences();
  }

  bool _isDailyScheduleActive = false;

  bool get isDailyScheduleActive => _isDailyScheduleActive;

  void _getDailySchedulePreferences() async {
    _isDailyScheduleActive = await preferencesHelper.isDailyNewsActive;
    notifyListeners();
  }

  void enableScheduleRestaurant(bool value) {
    preferencesHelper.setDailyNews(value);
    _getDailySchedulePreferences();
  }
}
