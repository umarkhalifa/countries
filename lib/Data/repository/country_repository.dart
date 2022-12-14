import 'package:all_countries/Data/model/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryRepository {
  Dio dio = Dio();
  var url = "https://restcountries.com/v3.1/all";

  Future<List<Country>> fetchCountries() async {
    final response = await dio.get(url);
    List<Country> countries = [];
    try {
      final data = response.data;
      for (var country in data) {
        final test = Country.fromJson(country);
        countries.add(test);
      }
    } catch (error) {
      throw Exception('Failed to load countries');
    }
    return countries;
  }
}

final countryRepositoryProvider = Provider((ref) => CountryRepository());
