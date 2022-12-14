import 'package:all_countries/L10n/l10n.dart';
import 'package:all_countries/Logic/view_model/language_provider.dart';
import 'package:all_countries/Presentation/screens/detail_view/detail_view_portrait.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../Data/model/country.dart';

class CountryCard extends ConsumerWidget {
  const CountryCard({
    Key? key,
    required this.country,
    required this.theme,
  }) : super(key: key);

  final Country country;
  final ThemeData theme;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final locale = ref.watch(localeProvider).locale;
    final language = L10n.getCountryLanguage(locale.languageCode);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPortrait(country: country),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(
                country.flag!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: SpinKitChasingDots(
                      color: theme.primaryColor,
                    ),
                  );
                },

                //! IMAGE FETCH ERROR
                errorBuilder: (context, object, trace) {
                  return Center(
                    child: Icon(
                      Icons.error,
                      color: theme.primaryColor,
                      size: 20,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                country.translation![language]['common'],
                style: TextStyle(color: theme.colorScheme.onBackground),
              ),
              Text(
                country.capital == null ? "NA" : country.capital![0],
                style:
                    TextStyle(color: theme.colorScheme.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
