import 'package:flutter/material.dart';
import 'package:weather_app/utils/theme_utils.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/row_data_of_weather_widget.dart';
import 'package:weather_app/widgets/custom_text_widget.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final themeColor = getThemeColor(weatherModel.condition);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeColor,
            themeColor.shade300,
            themeColor.shade50,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: weatherModel.cityName,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            CustomText(
              text:
                  'Updated at ${weatherModel.lastUpdated?.hour}:${weatherModel.lastUpdated?.minute}',
              fontSize: 20,
              color: Colors.white,
            ),
            RowDataOfWeather(weatherModel: weatherModel),
            CustomText(
              text: weatherModel.condition,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            CustomText(
              text: 'Humidity: ${weatherModel.humidity} %',
              fontSize: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
