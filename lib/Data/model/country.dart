class Country {
  final String? name;
  final bool? independent;
  final List<String>? capital;
  final String? region;
  final String? subregion;
  final int? population;
  final double? area;
  final List<String>? timezones;
  final String? flag;
  final String? coatOfArms;
  final String? startOfWeek;
  final bool? landlocked;
  final Map<String, dynamic>? callingCode;
  final String? car;
  final Map<String, dynamic>? ethnic;
  final Map<String, dynamic>? languages;
  final Map<String, dynamic>? currencies;
  final List<String>? borders;
  final Map<String, dynamic>? gini;

  Country({
    this.name,
    this.independent,
    this.capital,
    this.region,
    this.subregion,
    this.population,
    this.area,
    this.timezones,
    this.flag,
    this.coatOfArms,
    this.startOfWeek,
    this.landlocked,
    this.callingCode,
    this.car,
    this.ethnic,
    this.languages,
    this.currencies,
    this.borders,
    this.gini,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name']['common'] as String?,
        independent: json['independent'] as bool?,
        capital: (json['capital'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        region: json['region'] as String?,
        subregion: json['subregion'] as String?,
        population: json['population'] as int?,
        area: json['area'] as double?,
        timezones: (json['timezones'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        flag: json['flags']['png'] as String?,
        coatOfArms: json['coatOfArms']['png'] as String?,
        startOfWeek: json['startOfWeek'] as String?,
        landlocked: json['landlocked'] as bool?,
        callingCode: json['idd'] as Map<String, dynamic>?,
        car: json['car']['side'] as String?,
        ethnic: json['demonyms'] as Map<String, dynamic>?,
        languages: json['languages'] as Map<String, dynamic>?,
        currencies: json['currencies'] as Map<String, dynamic>?,
        borders: (json['borders'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        gini: json['gini'] as Map<String, dynamic>?);
  }
}