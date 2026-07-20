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
    final current = json['current'] as Map<String, dynamic>;
    final location = json['location'] as Map<String, dynamic>;
    final condition = current['condition'] as Map<String, dynamic>;
    return WeatherModel(
      cityName: location['name'] as String,
      lastUpdated: DateTime.parse(current['last_updated'] as String),
      condition: condition['text'] as String,
      avgtemp: (current['temp_c'] as num).toDouble(),
      maxtemp: (current['temp_c'] as num).toDouble(),
      mintemp: (current['temp_c'] as num).toDouble(),
      humidity: current['humidity'] as int,
      icon: condition['icon'] as String,
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

  @override
  String toString() {
    return 'WeatherModel(cityName: $cityName, avgtemp: $avgtemp, '
        'maxtemp: $maxtemp, mintemp: $mintemp, condition: $condition, '
        'humidity: $humidity, icon: $icon, lastUpdated: $lastUpdated)';
  }
}
