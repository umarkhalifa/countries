import 'package:all_countries/Data/model/country.dart';
import 'package:all_countries/Presentation/constants/measurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final detailProvider = StateProvider.autoDispose((ref) => 0);

class DetailPortrait extends HookWidget {
  final Country country;

  const DetailPortrait({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = [country.flag!, country.coatOfArms];
    final theme = Theme.of(context);
    final controller = usePageController();
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight(),
        width: context.screenWidth(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Consumer(builder: (context, ref, child) {
                final pageIndex = ref.watch(detailProvider);
                return SizedBox(
                  height: context.screenHeight() * 0.22,
                  width: context.screenWidth(),
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            height: context.screenHeight() * 0.3,
                            width: context.screenWidth(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7)),
                            child: Image.network(
                              images[pageIndex]!,
                              fit: pageIndex == 0
                                  ? BoxFit.fitWidth
                                  : BoxFit.contain,
                              //! IMAGE LOADING WIDGET
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return  Center(
                                  child: SpinKitChasingDots(
                                    color: theme.primaryColor,
                                  ),
                                );
                              },

                              //! IMAGE FETCH ERROR
                              errorBuilder: (context, object, trace) {
                                return  Center(
                                  child: Icon(
                                    Icons.error,
                                    color: theme.primaryColor,
                                    size: 20,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        itemCount: images.length,
                        controller: controller,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      Positioned(
                        left: 15,
                        right: 15,
                        top: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (pageIndex > 0) {
                                  ref.read(detailProvider.notifier).state = 0;
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: theme.colorScheme.secondary
                                    .withOpacity(0.5),
                                radius: 19,
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 12,
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (pageIndex < 1) {
                                  controller.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.easeIn);
                                  ref.read(detailProvider.notifier).state = 1;
                                }
                                controller.animateToPage(0,
                                    duration: const Duration(milliseconds: 600),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                backgroundColor: theme.colorScheme.secondary
                                    .withOpacity(0.5),
                                radius: 19,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                  color: theme.colorScheme.onBackground,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 15,
                        left: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: pageIndex == 0
                                  ? Colors.white
                                  : theme.colorScheme.secondary,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: pageIndex == 1
                                  ? Colors.white
                                  : theme.colorScheme.secondary,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              detailText(
                  title: "Population",
                  description: country.population.toString(),
                  context: context),
              detailText(
                  title: "Region",
                  description: country.region ?? 'NA',
                  context: context),
              detailText(
                  title: "Sub region",
                  description: country.subregion ?? 'NA',
                  context: context),
              detailText(
                  title: "Capital",
                  description:
                      country.capital == null ? 'NA' : country.capital![0],
                  context: context),
              const SizedBox(
                height: 40,
              ),
              detailText(
                  title: "Official Language",
                  description: country.languages == null
                      ? 'NA'
                      : country.languages!.values.join(','),
                  context: context),
              detailText(
                  title: "Ethic group",
                  description: country.ethnic == null
                      ? 'NA'
                      : country.ethnic!['eng']['m'],
                  context: context),
              detailText(
                  title: "Borders",
                  description: country.borders == null
                      ? 'NA'
                      : country.borders!.map((e) => e).join(','),
                  context: context),
              detailText(
                  title: "Landlocked",
                  description: country.landlocked.toString(),
                  context: context),
              const SizedBox(
                height: 40,
              ),
              detailText(
                  title: "Independent",
                  description: country.independent.toString(),
                  context: context),
              detailText(
                  title: "Area",
                  description: country.area.toString(),
                  context: context),
              detailText(
                  title: "Currencies",
                  description: country.currencies == null
                      ? 'NA'
                      : country.currencies!.values.first['name'],
                  context: context),
              detailText(
                  title: "Gini coefficient",
                  description: country.gini == null
                      ? 'NA'
                      : country.gini!.values.first.toString(),
                  context: context),
              const SizedBox(
                height: 40,
              ),
              detailText(
                  title: "Timezones",
                  description: country.timezones == null
                      ? 'NA'
                      : country.timezones!.map((e) => e).join(','),
                  context: context),
              detailText(
                  title: "Start of week",
                  description: country.startOfWeek ?? 'NA',
                  context: context),
              detailText(
                  title: "Dialing code",
                  description: country.callingCode == null
                      ? 'NA'
                      : '${country.callingCode!['root'] + country.callingCode!['suffixes'][0]}',
                  context: context),
              detailText(
                  title: "Driving Side ",
                  description: country.car ?? 'NA',
                  context: context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailText(
    {required String title,
    required String description,
    required BuildContext context}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w500,
                fontSize: 17),
          ),
          Text(description,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 17))
        ],
      ),
      const SizedBox(
        height: 7,
      ),
    ],
  );
}
