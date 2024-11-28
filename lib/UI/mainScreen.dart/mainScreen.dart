import 'package:flutter/material.dart';
import 'package:open_meteo_weather_api/Services/dateformat.dart';
import 'package:open_meteo_weather_api/UI/mainScreen.dart/mainScreenProvider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _initializeWeatherData();
  }

  Future<void> _initializeWeatherData() async {
    final provider = context.read<MainScreenProvider>();
    await provider.fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainScreenProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: const Text(
          'Weather Updates',
          style: TextStyle(color: Colors.purple),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              provider.cityName,
              style: const TextStyle(color: Colors.pink, fontSize: 16),
            ),
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.weatherModel == null
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.fetchWeatherData();
                    },
                    child: const Text('Retry'),
                  ),
                )
              : ListView.builder(
                  itemCount: provider.weatherModel!.time!.length,
                  itemBuilder: (context, index) {
                    final time = provider.weatherModel!.time![index];
                    final temperature =
                        provider.weatherModel!.temperature2m![index];
                    final formattedTime = getFormattedDate(time);

                    return ListTile(
                      tileColor: (index % 2) == 0
                          ? const Color.fromARGB(255, 192, 255, 194)
                          : const Color.fromARGB(255, 255, 212, 209),
                      title: Text(formattedTime),
                      trailing: Text(
                        'Temp: $temperature°C',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    );
                  },
                ),
    );
  }
}
