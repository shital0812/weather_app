import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider with ChangeNotifier {
  String _city = "Noida";
  bool _isCelsius = true;
  Map<String, dynamic>? _currentWeather;
  List<dynamic>? _forecast;

  String get city => _city;
  bool get isCelsius => _isCelsius;
  Map<String, dynamic>? get currentWeather => _currentWeather;
  List<dynamic>? get forecast => _forecast;

  Future<void> fetchWeather() async {
    final apiKey = "ccc5c2b9ada5fbdb162ccb9fb7bc38f6";
    final unit = _isCelsius ? "metric" : "imperial";
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$_city&units=$unit&appid=$apiKey'));
      if (response.statusCode == 200) {
        _currentWeather = json.decode(response.body);
        await fetchForecast();
        notifyListeners();
      } else {
        throw Exception("Failed to load weather data.");
      }
    } catch (e) {
      _currentWeather = null;
      notifyListeners();
    }
  }

  Future<void> fetchForecast() async {
    final apiKey = "ccc5c2b9ada5fbdb162ccb9fb7bc38f6";
    final unit = _isCelsius ? "metric" : "imperial";
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$_city&units=$unit&appid=$apiKey'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _forecast = data['list']?.sublist(0, 3);
        notifyListeners();
      } else {
        throw Exception("Failed to load forecast data.");
      }
    } catch (e) {
      _forecast = null;
      notifyListeners();
    }
  }

  void setCity(String city) {
    _city = city;
    savePreferences();
    fetchWeather();
  }

  void toggleUnit() {
    _isCelsius = !_isCelsius;
    savePreferences();
    fetchWeather();
  }

  Future<void> savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('city', _city);
    prefs.setBool('isCelsius', _isCelsius);
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _city = prefs.getString('city') ?? "Noida";
    _isCelsius = prefs.getBool('isCelsius') ?? true;
    fetchWeather();
  }
}
