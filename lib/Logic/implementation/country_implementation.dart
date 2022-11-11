import 'package:all_countries/Data/model/country.dart';

abstract class CountryImplementation{
  Future<List<Country>> getCountries();
}