import 'package:all_countries/Data/model/country.dart';
import 'package:all_countries/Data/model/query.dart';
import 'package:all_countries/Logic/view_model_provider.dart';
import 'package:all_countries/Presentation/constants/measurement.dart';
import 'package:all_countries/Presentation/constants/theme/theme_provider.dart';
import 'package:all_countries/Presentation/screens/detail_view/detail_view_portrait.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/bottomsheet.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/country_detail.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/language_bottom_sheet.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Logic/view_model/continent_filter.dart';
import '../../../Logic/view_model/query_filter.dart';
import '../../../Logic/view_model/timezone_filter.dart';

class HomePortrait extends ConsumerWidget {
  const HomePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeProvider).isDark;
    final view = ref.watch(countryProvider);
    final continent = ref.watch(continentListProvider);
    final timezone = ref.watch(timezoneListProvider);
    Query query = Query(continent: continent, timezone: timezone);
    return view.when(data: (data) {
      List<Country> countries = filter(data, query);
      countries.sort(
        (a, b) {
          return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
        },
      );
      return RefreshIndicator(
        onRefresh: () {
          return ref.refresh(countryProvider.future);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: context.screenHeight(),
            width: context.screenWidth(),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Elsie",
                          color: theme.colorScheme.onBackground),
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Elsie",
                          color: theme.primaryColor),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ref.read(themeProvider).toggleTheme(themeMode);
                      },
                      child: Icon(
                        themeMode
                            ? Icons.nightlight_round_sharp
                            : Icons.wb_sunny_outlined,
                        color: theme.colorScheme.onBackground,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    showSearch(delegate: ShowSearch(isDark: themeMode), context: context);
                  },
                  child: Container(
                      height: context.screenHeight() * 0.06,
                      width: context.screenWidth(),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.secondary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.search,
                            color: theme.colorScheme.onBackground,
                          ),
                          Text(
                            "Search Country",
                            style:
                                TextStyle(color: theme.colorScheme.onBackground),
                          ),
                          const SizedBox()
                        ],
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        showLanguage(context: context);
                      },
                      child: Container(
                        height: context.screenHeight() * 0.05,
                        width: context.screenWidth() * 0.2,
                        decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  color: theme.shadowColor,
                                  offset: const Offset(0, 1),
                                  blurRadius: 7)
                            ]),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.globe,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottom(context: context);
                      },
                      child: Container(
                        height: context.screenHeight() * 0.05,
                        width: context.screenWidth() * 0.2,
                        decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  color: theme.shadowColor,
                                  offset: const Offset(0, 1),
                                  blurRadius: 7)
                            ]),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.filter,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPortrait(country: countries[index])));
                        },
                        child:
                            CountryCard(country: countries[index], theme: theme),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: countries.length > 15 ? 15 : countries.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }, error: (_, __) {
      return Center(
          child: Text(
        'Unable to fetch data',
        style: TextStyle(color: theme.colorScheme.onBackground),
      ));
    }, loading: () {
      return SpinKitChasingDots(
        color: theme.primaryColor,
      );
    });
  }
}
