import 'package:all_countries/Data/model/country.dart';
import 'package:all_countries/Logic/controller/request_view_model.dart';
import 'package:all_countries/Logic/manager/country_dm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryViewModel extends RequestStateNotifier<List<Country>>{
  final Ref ref;
  CountryViewModel(this.ref);

  void getCountries (){
    makeRequest(() => ref.read(countryDataManager).getCountries());
  }
}
