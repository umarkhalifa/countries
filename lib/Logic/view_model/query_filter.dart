import '../../Data/model/country.dart';
import '../../Data/model/query.dart';

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
        .where((country) => (query.timezone.contains(country.timezones!.first)))
        .toList();
  }
  else{
    return countries
        .where((country) =>
    (query.continent.contains(country.region))&&
        (query.timezone.contains(country.timezones!.first))
    )
        .toList();
  }
}
