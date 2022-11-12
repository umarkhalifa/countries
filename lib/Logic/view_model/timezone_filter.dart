import 'package:flutter_riverpod/flutter_riverpod.dart';

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


final timezoneListProvider = StateNotifierProvider<TimezoneList, List<String>>((ref) => TimezoneList());
