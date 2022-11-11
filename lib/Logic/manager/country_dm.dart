import 'package:all_countries/Data/model/country.dart';
import 'package:all_countries/Data/repository/country_repository.dart';
import 'package:all_countries/Logic/implementation/country_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryDataManager extends CountryImplementation{
  final CountryRepository countryRepository;
  CountryDataManager({required this.countryRepository});

  @override
  Future<List<Country>> getCountries()async {
    return await countryRepository.fetchCountries();
  }


}
final countryDataManager = Provider((ref) {
  final countryManager = ref.watch(countryRepositoryProvider);
  return CountryDataManager(countryRepository: countryManager);
});