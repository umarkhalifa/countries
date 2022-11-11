import 'package:all_countries/Data/model/country.dart';
import 'package:all_countries/Data/model/test.dart';
import 'package:all_countries/Logic/view_model_provider.dart';
import 'package:all_countries/Presentation/constants/measurement.dart';
import 'package:all_countries/Presentation/constants/theme/theme_provider.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/bottomsheet.dart';
import 'package:all_countries/Presentation/screens/home_view/widgets/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePortrait extends ConsumerWidget {
  const HomePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeProvider).isDark;
    final view = ref.watch(countryProvider);
    final continent = ref.watch(continentListProvider);
    final timezone = ref.watch(continentListProvider);
    Query query = Query(continent: continent, timezone: timezone);
    return view.when(data: (data) {
      List<Country> countries = filter(data, query);
      countries.sort(
        (a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        },
      );
      return Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: context.screenHeight(),
          width: context.screenWidth(),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Explore",style: TextStyle(fontSize: 20,fontFamily: "Elsie"),),
                  Text(".",style: TextStyle(fontSize: 20,fontFamily: "Elsie",color: theme.primaryColor),),
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
              Container(
                height: context.screenHeight() * 0.06,
                width: context.screenWidth(),
                decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  style: TextStyle(color: theme.colorScheme.secondary),
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    countries.where((element) => element.name.contains(value));
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search Country",
                    hintStyle: TextStyle(color: theme.colorScheme.secondary,fontSize: 17)
                  ),
                )
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CountryCard(
                          country: countries[index], theme: theme);
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: countries.length > 15 ? 15 : countries.length),
              )
            ],
          ),
        ),
      );
    }, error: (_, __) {
      return const Text('error');
    }, loading: () {
      return SpinKitChasingDots(
        color: theme.primaryColor,
      );
    });
  }
}
