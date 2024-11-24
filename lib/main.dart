import 'package:flutter/material.dart';
import 'package:open_meteo_weather_api/UI/mainScreen.dart/mainScreen.dart';
import 'package:open_meteo_weather_api/UI/mainScreen.dart/mainScreenProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainScreenProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
