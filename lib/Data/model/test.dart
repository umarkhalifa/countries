import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'country.dart';

class Query {
  List<String> continent;
  List<String> timezone;

  Query({required this.continent, required this.timezone});
}

class ContinentList extends StateNotifier<List<String>> {
  ContinentList([List<String>? continents]) : super(continents ?? []);

  void add(String continent) {
    state = [...state, continent];
  }

  void delete(String continent) {
    state = state.where((element) => continent != element).toList();
  }
  void reset(){
    state = [];
  }
}

class TimezoneList extends StateNotifier<List<String>> {
  TimezoneList([List<String>? timezones]) : super(timezones ?? []);

  void add(String timezone) {
    state = [...state, timezone];
  }

  void remove(String timezone) {
    state = state.where((element) => timezone != element).toList();
  }

  void reset(){
    state = [];
  }
}

final continentListProvider =
    StateNotifierProvider<ContinentList, List<String>>(
        (ref) => ContinentList());
final timezoneListProvider = StateNotifierProvider<TimezoneList, List<String>>((ref) => TimezoneList());

List<Country> filter(List<Country> countries, Query query) {
  if (query.continent.isEmpty && query.timezone.isEmpty) {
    return countries;
  }
  else if (query.continent.isNotEmpty && query.timezone.isEmpty) {
    return countries
        .where((country) => (query.continent.contains(country.region)))
        .toList();
  }
  else if (query.continent.isEmpty && query.timezone.isNotEmpty) {
    return countries
        .where((country) => (query.timezone.contains(country.timezone)))
        .toList();
  }
  else{
    return countries
        .where((country) =>
    (query.continent.contains(country.region))&&
        (query.timezone.contains(country.timezone))
    )
        .toList();
  }
}
