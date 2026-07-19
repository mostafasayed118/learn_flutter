class WeatherModel {
  final String cityName;
  final double avgtemp;
  final double maxtemp;
  final double mintemp;
  final String condition;
  final int humidity;
  final String? icon;
  final DateTime? lastUpdated;

  WeatherModel({
    required this.cityName,
    required this.avgtemp,
    required this.maxtemp,
    required this.mintemp,
    required this.condition,
    required this.humidity,
    required this.icon,
    required this.lastUpdated,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'] as String,
      lastUpdated: json['current']['last_updated'] as DateTime,
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'] as String,
      avgtemp: (json['forecast']['forecastday'][0]['day']['avgtemp_c'] as num)
          .toDouble(),
      maxtemp: (json['forecast']['forecastday'][0]['day']['maxtemp_c'] as num)
          .toDouble(),
      mintemp: (json['forecast']['forecastday'][0]['day']['mintemp_c'] as num)
          .toDouble(),
      humidity: json['current']['humidity'] as int,
      icon: json['forecast']['forecastday'][0]['day']['condition']['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'avgtemp': avgtemp,
      'maxtemp': maxtemp,
      'mintemp': mintemp,
      'condition': condition,
      'humidity': humidity,
      'icon': icon,
    };
  }
}
