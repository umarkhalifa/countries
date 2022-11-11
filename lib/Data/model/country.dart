class Country {
  String name;
  dynamic capital;
  int? population;
  double area;
  String region;
  String? subRegion;
  String timezone;
  dynamic language;
  String flag;
  String? coatOfArms;
  Currencies? currencies;
  // String? callingCode;

  Country(
      { required this.name,
      required this.area,
      this.capital,
        this.coatOfArms,
       required this.flag,
       this.language,
       this.population,
       required this.region,
       this.subRegion,
        this.currencies,
       required this.timezone,
        // this.callingCode
      });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json['name']['common'],
        area: json['area'],
        capital: json['capital'][0],
        coatOfArms: json['coatOfArms']['png'],
        currencies: json['currencies'],
        flag: json['flags']['png'],
        language: json['languages'],
        population: json['population'],
        region: json['region'],
        subRegion: json['subregion'] ?? "NA",
        timezone: json['timezones'][0]);
  }
}
class Currencies {
  final PEN? pEN;

  Currencies({
    this.pEN,
  });

  Currencies.fromJson(Map<String, dynamic> json)
      : pEN = (json['PEN'] as Map<String,dynamic>?) != null ? PEN.fromJson(json['PEN'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'PEN' : pEN?.toJson()
  };
}
class PEN {
  final String? name;
  final String? symbol;

  PEN({
    this.name,
    this.symbol,
  });

  PEN.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        symbol = json['symbol'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'symbol' : symbol
  };
}