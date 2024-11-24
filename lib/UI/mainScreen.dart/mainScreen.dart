import 'package:flutter/material.dart';
import 'package:open_meteo_weather_api/Model/WeatherModel.dart';
import 'package:open_meteo_weather_api/UI/mainScreen.dart/mainScreenProvider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<void> _weatherDataFuture;

  @override
  void initState() {
    super.initState();
    // Initialize data fetch
    _weatherDataFuture = _initializeWeatherData();
  }

  Future<void> _initializeWeatherData() async {
    // Fetch location and weather data using the provider
    final provider = context.read<MainScreenProvider>();
    await provider.fetchLocation();
    await provider.fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Weather Updates'),
            centerTitle: true,
          ),
          body: FutureBuilder<void>(
            future: _weatherDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (provider.weatherModel?.hourlyUnits == null) {
                print('weather temperature ');
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _weatherDataFuture = _initializeWeatherData();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: provider.weatherModel!.hourlyUnits!.time!.length,
                  itemBuilder: (context, index) {
                    final time =
                        provider.weatherModel!.hourlyUnits!.time![index];
                    final temperature = provider
                        .weatherModel!.hourlyUnits!.temperature2m![index];
                    return ListTile(
                      title: Text('Time: $time'),
                      trailing: Text('Temperature: $temperature°C'),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
