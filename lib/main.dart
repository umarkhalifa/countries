import 'package:all_countries/Presentation/constants/theme/theme.dart';
import 'package:all_countries/Presentation/constants/theme/theme_provider.dart';
import 'package:all_countries/Presentation/screens/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider).themeMode;
    return MaterialApp(
      themeMode: theme,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
