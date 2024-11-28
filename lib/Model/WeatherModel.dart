class WeatherModel {
  double? latitude;
  double? longitude;
  String? timezone;
  HourlyUnits? hourlyUnits;
  List<String>? time;
  List<double>? temperature2m;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.timezone,
    this.hourlyUnits,
    this.time,
    this.temperature2m,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    hourlyUnits = json['hourly_units'] != null
        ? HourlyUnits.fromJson(json['hourly_units'])
        : null;
    time = json['hourly']['time'] != null
        ? List<String>.from(json['hourly']['time'])
        : [];
    temperature2m = json['hourly']['temperature_2m'] != null
        ? List<double>.from(json['hourly']['temperature_2m'])
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['timezone'] = timezone;
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    data['hourly'] = {
      'time': time,
      'temperature_2m': temperature2m,
    };
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;

  HourlyUnits({this.time, this.temperature2m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    return data;
  }
}
