import 'dart:io';

import 'package:all_countries/L10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleProvider extends ChangeNotifier{
  Locale locale = Locale(Platform.localeName);

  void setLocale(Locale newLocale){
    if(L10n.all.contains(locale) == false) return;
    locale = newLocale;
    notifyListeners();
  }
}

final localeProvider = ChangeNotifierProvider<LocaleProvider>((ref) => LocaleProvider());