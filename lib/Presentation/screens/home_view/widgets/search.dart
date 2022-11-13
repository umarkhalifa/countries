import 'package:all_countries/Logic/view_model_provider.dart';
import 'package:all_countries/Presentation/constants/theme/theme.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Data/model/country.dart';

class ShowSearch extends SearchDelegate {
  final bool isDark;

  ShowSearch({required this.isDark});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return isDark ? AppThemes.darkTheme : AppThemes.lightTheme;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      List<Country> countries = [];
      final test = ref.read(countryProvider).value!;
      for (Country country in test) {
        if (country.name!.toLowerCase().contains(query.toLowerCase())) {
          countries.add(country);
        }
      }
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return CountryCard(
                  country: countries[index], theme: Theme.of(context));
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: countries.length),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        List<Country> countries = [];
        final test = ref.read(countryProvider).value!;
        for (Country country in test) {
          if (country.name!.toLowerCase().contains(query.toLowerCase())) {
            countries.add(country);
          }
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return CountryCard(
                    country: countries[index], theme: Theme.of(context));
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: countries.length),
        );
      },
    );
  }
}
