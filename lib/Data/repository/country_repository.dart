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
        print(test.name);
        countries.add(test);
      }
    } catch (error) {
      throw Exception('Failed to load countries');
    }
    return countries;
  }
}

final countryRepositoryProvider = Provider((ref) => CountryRepository());

//
// class CountryRepository {
//   Dio dio = Dio();
//   var url = "https://restcountries.com/v3.1/all";
//
//   Future<List<Country>> fetchCountries() async {
//     final response = await dio.get(url);
//     List<Country> countries = [];
//     try {
//       final data = response.data;
//       for (var country in data) {
//         final test = Country(
//           name: country['name']['common'],
//           area: country['area'],
//           capital: country['capital'] ?? 'NA',
//           coatOfArms: country['coatOfArms']['png'],
//           currencies: (country['currencies'] as Map<String, dynamic>?) != null
//               ? Currencies.fromJson(
//                   country['currencies'] as Map<String, dynamic>)
//               : null,
//           flag: country['flags']['png'],
//           language: country['languages'],
//           population: country['population'],
//           region: country['region'],
//           subRegion: country['subregion'] ?? 'NA',
//           timezone: country['timezones'][0],
//           car : (country['car'] as Map<String,dynamic>?) != null ? Car.fromJson(country['car'] as Map<String,dynamic>) : null,
//         );
//         countries.add(test);
//       }
//     } catch (error) {
//       print(error);
//       throw Exception('Failed to load countries');
//     }
//     return countries;
//   }
// }
//
// final countryRepositoryProvider = Provider((ref) => CountryRepository());
