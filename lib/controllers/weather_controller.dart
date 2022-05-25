import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:multi_info_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherController extends ChangeNotifier {
  Weather? _weatherData;
  bool _isLoading = false;
  String _inputText = 'São paulo';

  Weather? get weatherData => _weatherData;
  bool get isLoading => _isLoading;

  void setText(String text) {
    _inputText = text;
    notifyListeners();
  }

  Future<void> getWeather({double? longitude, double? latitude}) async {
    const weatherKey = String.fromEnvironment('API_WEATHER_KEY');
    String url = '';

    if (longitude == null && latitude == null) {
      url =
          'https://api.openweathermap.org/data/2.5/weather?q=$_inputText&appid=$weatherKey&lang=pt_br&units=metric';
    } else {
      url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon={$longitude}&appid=$weatherKey&lang=pt_br&units=metric';
    }

    final uri = Uri.parse(url);

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(uri);

      _weatherData = Weather.fromJson(jsonDecode(response.body));
    } catch (error) {
      throw Exception('Ocorreu um erro!');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
