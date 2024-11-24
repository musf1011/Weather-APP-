import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_meteo_weather_api/Model/WeatherModel.dart';
import 'package:open_meteo_weather_api/Services/geoLocator.dart';

class MainScreenProvider extends ChangeNotifier {
  var latitude = 0.0;
  var longitude = 0.0;
  WeatherModel? weatherModel;
  bool isLoading = false;
  Future<void> fetchLocation() async {
    final deviceLocation = await geoLocation();
    latitude = deviceLocation.latitude;
    longitude = deviceLocation.longitude;
  }

  Future<void> fetchWeatherData() async {
    isLoading = true;
    notifyListeners();
    try {
      await fetchLocation();
      final url =
          'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        weatherModel = WeatherModel.fromJson(json);
        print(
            'Weather data fetched: ${weatherModel?.hourlyUnits!.temperature2m}');
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      // Log the error for analysis
      debugPrint('Error fetching weather data: $e');
      // Provide user-friendly error feedback (e.g., snackbar)
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('An error occurred while fetching weather data.'),
      //   ),
      // );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
