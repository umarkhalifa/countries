import 'package:flutter_riverpod/flutter_riverpod.dart';

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
final continentListProvider =
StateNotifierProvider<ContinentList, List<String>>(
        (ref) => ContinentList());