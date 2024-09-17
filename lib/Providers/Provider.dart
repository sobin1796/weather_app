import 'package:flutter/material.dart';
import 'package:weather_app/api_services/api.dart';
import 'package:weather_app/weather_model/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weatherdata;
  bool isLoading = false;
  WeatherModel? get weatherdata => _weatherdata;
  Future<void> fetchWeather(String location) async {
    isLoading = true;
    notifyListeners();
    try {
      final data = await WeatherApi.getData(location);
      _weatherdata = data;
    } catch (e) {
      _weatherdata = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
