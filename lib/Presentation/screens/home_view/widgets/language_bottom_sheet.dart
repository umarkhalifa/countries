import 'package:all_countries/L10n/l10n.dart';
import 'package:all_countries/Logic/view_model/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final List<String> languages = ['English',]
showLanguage({required BuildContext context}) {
  final theme = Theme.of(context);

  return showModalBottomSheet(
    context: (context),
    backgroundColor: theme.scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final currentLanguage = ref.watch(localeProvider).locale;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                  children: L10n.all.map((locale) {
                final language = L10n.getLanguage(locale.languageCode);
                return ListTile(
                  title: Text(
                    language,
                    style: TextStyle(color: theme.colorScheme.onBackground),
                  ),
                  trailing: GestureDetector(
                    child: Radio(
                        value: locale,
                        activeColor: theme.primaryColor,
                        groupValue: currentLanguage,
                        onChanged: (value) {
                          ref.read(localeProvider).setLocale(locale);
                        }),
                  ),
                );
              }).toList()),
            ),
          );
        },
      );
    },
  );
}
