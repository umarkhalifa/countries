import 'package:all_countries/Presentation/constants/measurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Data/model/continents_timezones.dart';
import '../../../../Logic/view_model/continent_filter.dart';
import '../../../../Logic/view_model/timezone_filter.dart';

final continentIndex = StateProvider((ref) => false);
final timezoneIndex = StateProvider((ref) => false);

showBottom({required BuildContext context}) {
  final theme = Theme.of(context);
  showModalBottomSheet(
    backgroundColor: theme.scaffoldBackgroundColor,
    context: (context),
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
          final continent = ref.watch(continentListProvider);
          final timezone = ref.watch(timezoneListProvider);
          return SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(
                            color: theme.colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                            fontSize: 19),
                      ),
                      //
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.secondary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            FontAwesomeIcons.x,
                            color: theme.colorScheme.secondary,
                            size: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      'Continent',
                      style: TextStyle(color: theme.colorScheme.onBackground),
                    ),
                    iconColor: theme.colorScheme.onBackground,
                    backgroundColor: Colors.transparent,
                    children: continents
                        .map(
                          (e) => ListTile(
                            title: Text(e,
                                style: TextStyle(
                                    color: theme.colorScheme.onBackground)),
                            trailing: GestureDetector(
                              onTap: () {
                                continent.contains(e)
                                    ? ref
                                        .read(continentListProvider.notifier)
                                        .delete(e)
                                    : ref
                                        .read(continentListProvider.notifier)
                                        .add(e);
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: theme.colorScheme.onBackground),
                                    color: continent.contains(e)
                                        ? theme.colorScheme.onBackground
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                child: continent.contains(e)
                                    ? Icon(
                                        Icons.check,
                                        color: theme.scaffoldBackgroundColor,
                                        size: 17,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Timezones",
                      style: TextStyle(color: theme.colorScheme.onBackground),
                    ),
                    iconColor: theme.colorScheme.onBackground,
                    backgroundColor: Colors.transparent,
                      children: timezones
                                .map(
                                  (e) => ListTile(
                                    title: Text(e,
                                        style: TextStyle(
                                            color: theme.colorScheme.onBackground)),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        timezone.contains(e)
                                            ? ref
                                                .read(timezoneListProvider.notifier)
                                                .remove(e)
                                            : ref
                                                .read(timezoneListProvider.notifier)
                                                .add(e);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    theme.colorScheme.onBackground),
                                            color: timezone.contains(e)
                                                ? theme.colorScheme.onBackground
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: timezone.contains(e)
                                            ? Icon(
                                                Icons.check,
                                                color:
                                                    theme.scaffoldBackgroundColor,
                                                size: 17,
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                  ),
              const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref.read(continentListProvider.notifier).reset();
                        ref.read(timezoneListProvider.notifier).reset();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: context.screenHeight() * 0.06,
                        width: context.screenWidth() * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: theme.colorScheme.onBackground),
                        ),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: TextStyle(
                                color: theme.colorScheme.onBackground),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: context.screenHeight() * 0.06,
                        width: context.screenWidth() * 0.65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: theme.primaryColor,
                        ),
                        child: const Center(
                          child: Text(
                            "Show Results",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],)
                  // ExpansionPanelList(
                  //   expansionCallback: (index, isExpanded) {
                  //     if (index == 0) {
                  //       ref.read(continentIndex.notifier).state = !isExpanded;
                  //     } else {
                  //       ref.read(timezoneIndex.notifier).state = !isExpanded;
                  //     }
                  //   },
                  //   elevation: 0,
                  //   children: [
                  //     ExpansionPanel(
                  //       isExpanded: ref.watch(continentIndex),
                  //       canTapOnHeader: true,
                  //       headerBuilder: (context, isExpanded) {
                  //         return ListTile(
                  //           title: Text(
                  //             "Continent",
                  //             style: TextStyle(
                  //                 color: theme.colorScheme.onBackground),
                  //           ),
                  //         );
                  //       },
                  //       body: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: continents
                  //             .map(
                  //               (e) => ListTile(
                  //                 title: Text(e,
                  //                     style: TextStyle(
                  //                         color: theme.colorScheme.onBackground)),
                  //                 trailing: GestureDetector(
                  //                   onTap: () {
                  //                     continent.contains(e)
                  //                         ? ref
                  //                             .read(
                  //                                 continentListProvider.notifier)
                  //                             .delete(e)
                  //                         : ref
                  //                             .read(
                  //                                 continentListProvider.notifier)
                  //                             .add(e);
                  //                   },
                  //                   child: Container(
                  //                     height: 25,
                  //                     width: 25,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(
                  //                             color:
                  //                                 theme.colorScheme.onBackground),
                  //                         color: continent.contains(e)
                  //                             ? theme.colorScheme.onBackground
                  //                             : Colors.transparent,
                  //                         borderRadius: BorderRadius.circular(5)),
                  //                     child: continent.contains(e)
                  //                         ? Icon(
                  //                             Icons.check,
                  //                             color:
                  //                                 theme.scaffoldBackgroundColor,
                  //                             size: 17,
                  //                           )
                  //                         : const SizedBox(),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //             .toList(),
                  //       ),
                  //     ),
                  //     ExpansionPanel(
                  //       isExpanded: ref.watch(timezoneIndex),
                  //       headerBuilder: (context, isExpanded) {
                  //         return ListTile(
                  //           title: Text("Timezone",
                  //               style: TextStyle(
                  //                   color: theme.colorScheme.onBackground)),
                  //         );
                  //       },
                  //       body: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: timezones
                  //             .map(
                  //               (e) => ListTile(
                  //                 title: Text(e,
                  //                     style: TextStyle(
                  //                         color: theme.colorScheme.onBackground)),
                  //                 trailing: GestureDetector(
                  //                   onTap: () {
                  //                     timezone.contains(e)
                  //                         ? ref
                  //                             .read(timezoneListProvider.notifier)
                  //                             .remove(e)
                  //                         : ref
                  //                             .read(timezoneListProvider.notifier)
                  //                             .add(e);
                  //                   },
                  //                   child: Container(
                  //                     height: 25,
                  //                     width: 25,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.all(
                  //                             color:
                  //                                 theme.colorScheme.onBackground),
                  //                         color: timezone.contains(e)
                  //                             ? theme.colorScheme.onBackground
                  //                             : Colors.transparent,
                  //                         borderRadius: BorderRadius.circular(5)),
                  //                     child: timezone.contains(e)
                  //                         ? Icon(
                  //                             Icons.check,
                  //                             color:
                  //                                 theme.scaffoldBackgroundColor,
                  //                             size: 17,
                  //                           )
                  //                         : const SizedBox(),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //             .toList(),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         ref.read(continentListProvider.notifier).reset();
                  //         ref.read(timezoneListProvider.notifier).reset();
                  //         Navigator.pop(context);
                  //       },
                  //       child: Container(
                  //         height: context.screenHeight() * 0.07,
                  //         width: context.screenWidth() * 0.25,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8),
                  //           border:
                  //               Border.all(color: theme.colorScheme.onBackground),
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             "Reset",
                  //             style: TextStyle(
                  //                 color: theme.colorScheme.onBackground),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Container(
                  //         height: context.screenHeight() * 0.07,
                  //         width: context.screenWidth() * 0.65,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8),
                  //           color: theme.primaryColor,
                  //         ),
                  //         child: const Center(
                  //           child: Text(
                  //             "Show Results",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
