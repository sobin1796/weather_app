import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather_model/weather_model.dart';

class WeatherApi {
  static const String apiKey = "76c91100a4444d4c91c143421241009";

  // Fetch weather data for a specific location
  static Future<WeatherModel?> getData(String location) async {
    final String baseUrl =
        "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location";
    var url = Uri.parse(baseUrl);

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        return WeatherModel.fromJson(data);
      } else {
        print("Failed to load data: ${res.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
