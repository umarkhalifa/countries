
import 'package:all_countries/Data/model/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Data/repository/country_repository.dart';

final countryProvider = FutureProvider<List<Country>>((ref) => ref.read(countryRepositoryProvider).fetchCountries());