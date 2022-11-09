class Country {
  String name;
  String capital;
  int population;
  double area;
  String region;
  String subRegion;
  String timezone;
  String currency;
  String language;
  String flag;
  String coatOfArms;
  int callingCode;

  Country(
      {required this.name,
      required this.area,
      required this.capital,
      required this.coatOfArms,
      required this.currency,
      required this.flag,
      required this.language,
      required this.population,
      required this.region,
      required this.subRegion,
      required this.timezone,
      required this.callingCode});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name'],
        area: json['area'],
        callingCode: json['callingCodes'][0],
        capital: json['capital'],
        coatOfArms: json['alpha2Code'],
        currency: json['currencies'][0]['name'],
        flag: json['flags']['png'],
        language: json['languages'][0]['name'],
        population: json['population'],
        region: json['region'],
        subRegion: json['subregion'],
        timezone: json['currencies'][0]['name']);
  }
}
