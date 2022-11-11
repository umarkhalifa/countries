class Country {
  String name;
  dynamic capital;
  int? population;
  double area;
  String region;
  String? subRegion;
  String timezone;
  dynamic currency;
  dynamic language;
  String flag;
  String? coatOfArms;
  // String? callingCode;

  Country(
      { required this.name,
      required this.area,
      this.capital,
        this.coatOfArms,
       this.currency,
       required this.flag,
       this.language,
       this.population,
       required this.region,
       this.subRegion,
       required this.timezone,
        // this.callingCode
      });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name']['common'],
        area: json['area'],
        // callingCode: json['callingCodes'][0],
        capital: json['capital'][0],
        coatOfArms: json['coatOfArms']['png'],
        currency: json['currencies'],
        flag: json['flags']['png'],
        language: json['languages'],
        population: json['population'],
        region: json['region'],
        subRegion: json['subregion'] ?? "NA",
        timezone: json['timezones'][0]);
  }
}
