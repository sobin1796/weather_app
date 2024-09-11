class WeatherModel {
  final String? name;
  final String? country;
  final String? zone;
  final String? time;
  final double? tempC;
  final double? tempF;
  final String? conditionText;
  final String? conditionIcon;
  final double? windMph;
  final double? windKph;
  final int? humidity;
  final double? rain;
  final double? pressure;
  final double? heatindex;
  final String? windr;
  final double? feelslike;

  WeatherModel({
    this.name,
    this.country,
    this.zone,
    this.time,
    this.tempC,
    this.tempF,
    this.conditionText,
    this.conditionIcon,
    this.windMph,
    this.windKph,
    this.humidity,
    this.rain,
    this.pressure,
    this.heatindex,
    this.windr,
    this.feelslike,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'],
      country: json['location']['country'],
      zone: json['location']['tz_id'],
      time: json['location']['localtime'],
      tempC: json['current']['temp_c'],
      tempF: json['current']['temp_f'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      windMph: json['current']['wind_mph'],
      windKph: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      rain: json['current']['precip_mm'],
      pressure: json['current']['precip_in'],
      heatindex: json['current']['heatindex_c'],
      windr: json['current']['wind_dir'],
      feelslike: json['current']['feelslike_c'],
    );
  }
}
