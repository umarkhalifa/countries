import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeStyle extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.system;

  bool get isDark{
    if(themeMode == ThemeMode.system){
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else{
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool dark){
    if(dark == true){
      themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
final themeProvider = ChangeNotifierProvider<ThemeStyle>((ref) {
  return ThemeStyle();
});
