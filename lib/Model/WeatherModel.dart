// class WeatherModel {
//   double? latitude;
//   double? longitude;
//   double? generationtimeMs;
//   int? utcOffsetSeconds;
//   String? timezone;
//   String? timezoneAbbreviation;
//   int? elevation;
//   HourlyUnits? hourlyUnits;
//   Hourly? hourly;

//   WeatherModel(
//       {this.latitude,
//       this.longitude,
//       this.generationtimeMs,
//       this.utcOffsetSeconds,
//       this.timezone,
//       this.timezoneAbbreviation,
//       this.elevation,
//       this.hourlyUnits,
//       this.hourly});

//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     generationtimeMs = json['generationtime_ms'];
//     utcOffsetSeconds = json['utc_offset_seconds'];
//     timezone = json['timezone'];
//     timezoneAbbreviation = json['timezone_abbreviation'];
//     elevation = json['elevation'];
//     hourlyUnits = json['hourly_units'] != null
//         ? new HourlyUnits.fromJson(json['hourly_units'])
//         : null;
//     hourly =
//         json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['generationtime_ms'] = this.generationtimeMs;
//     data['utc_offset_seconds'] = this.utcOffsetSeconds;
//     data['timezone'] = this.timezone;
//     data['timezone_abbreviation'] = this.timezoneAbbreviation;
//     data['elevation'] = this.elevation;
//     if (this.hourlyUnits != null) {
//       data['hourly_units'] = this.hourlyUnits!.toJson();
//     }
//     if (this.hourly != null) {
//       data['hourly'] = this.hourly!.toJson();
//     }
//     return data;
//   }
// }

// class HourlyUnits {
//   String? time;
//   String? temperature2m;

//   HourlyUnits({this.time, this.temperature2m});

//   HourlyUnits.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     temperature2m = json['temperature_2m'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['temperature_2m'] = this.temperature2m;
//     return data;
//   }
// }

// class Hourly {
//   List<String>? time;
//   List<double>? temperature2m;

//   Hourly({this.time, this.temperature2m});

//   Hourly.fromJson(Map<String, dynamic> json) {
//     time = json['time'].cast<String>();
//     temperature2m = json['temperature_2m'].cast<double>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['temperature_2m'] = this.temperature2m;
//     return data;
//   }
// }

// class WeatherModel {
//   double? latitude;
//   double? longitude;
//   double? generationtimeMs;
//   int? utcOffsetSeconds;
//   String? timezone;
//   String? timezoneAbbreviation;
//   int? elevation;
//   HourlyUnits? hourlyUnits;
//   Hourly? hourly;

//   WeatherModel(
//       {this.latitude,
//       this.longitude,
//       this.generationtimeMs,
//       this.utcOffsetSeconds,
//       this.timezone,
//       this.timezoneAbbreviation,
//       this.elevation,
//       this.hourlyUnits,
//       this.hourly});

//   WeatherModel.fromJson(Map<String, dynamic> json) {
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     generationtimeMs = json['generationtime_ms'];
//     utcOffsetSeconds = json['utc_offset_seconds'];
//     timezone = json['timezone'];
//     timezoneAbbreviation = json['timezone_abbreviation'];
//     elevation = json['elevation'];
//     hourlyUnits = json['hourly_units'] != null
//         ? new HourlyUnits.fromJson(json['hourly_units'])
//         : null;
//     hourly =
//         json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['generationtime_ms'] = this.generationtimeMs;
//     data['utc_offset_seconds'] = this.utcOffsetSeconds;
//     data['timezone'] = this.timezone;
//     data['timezone_abbreviation'] = this.timezoneAbbreviation;
//     data['elevation'] = this.elevation;
//     if (this.hourlyUnits != null) {
//       data['hourly_units'] = this.hourlyUnits!.toJson();
//     }
//     if (this.hourly != null) {
//       data['hourly'] = this.hourly!.toJson();
//     }
//     return data;
//   }
// }

// class HourlyUnits {
//   String? time;
//   String? temperature2m;

//   HourlyUnits({this.time, this.temperature2m});

//   HourlyUnits.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     temperature2m = json['temperature_2m'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['temperature_2m'] = this.temperature2m;
//     return data;
//   }
// }

// class Hourly {
//   List<String>? time;
//   List<double>? temperature2m;

//   Hourly({this.time, this.temperature2m});

//   Hourly.fromJson(Map<String, dynamic> json) {
//     time = json['time'].cast<String>();
//     temperature2m = json['temperature_2m'].cast<double>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['temperature_2m'] = this.temperature2m;
//     return data;
//   }
// }

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
