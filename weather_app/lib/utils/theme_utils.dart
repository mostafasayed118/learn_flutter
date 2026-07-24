import 'package:flutter/material.dart';

MaterialColor getThemeColor(String condition) {
  if (condition.isEmpty) {
    return Colors.blueGrey;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'overcast':
    case 'haze':
    case 'mist':
    case 'fog':
    case 'freezing fog':
    case 'smoke':
    case 'smoky haze':
    case 'smog':
    case 'severe smog':
      return Colors.blueGrey;
    case 'cloudy':
      return Colors.grey;
    case 'dust haze':
    case 'blowing dust':
    case 'dust storm':
    case 'saharan dust':
    case 'dust':
      return Colors.brown;
    case 'sandstorm':
    case 'severe sandstorm':
      return Colors.orange;
    case 'patchy rain possible':
    case 'patchy freezing drizzle possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.blue;
    case 'patchy snow possible':
    case 'blowing snow':
    case 'blizzard':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'ice pellets':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.indigo;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepOrange;
    default:
      return Colors.blueGrey;
  }
}