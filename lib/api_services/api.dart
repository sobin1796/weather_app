import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather_model/weather_model.dart';

class WeatherApi {
  static const String baseurl =
      "https://api.weatherapi.com/v1/current.json?key=76c91100a4444d4c91c143421241009&q=bhaktapur";

  // Fetch data from API
  static Future<WeatherModel?> getData() async {
    var url = Uri.parse(baseurl);

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
