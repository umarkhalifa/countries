import 'package:all_countries/Data/model/country.dart';
import 'package:dio/dio.dart';

class CountryRepository{
  Dio dio = Dio();
  var url = "https://restcountries.com/v2/all";
  Future fetchCountries() async {
    final response = await dio.get(url);
    List<Country> countries = [];


    try{
      final data = response.data;
      for(var country in data){
        countries.add(Country.fromJson(country));
      }

    }catch (error){
     throw Exception('Failed to load countries');

    }
  }
}