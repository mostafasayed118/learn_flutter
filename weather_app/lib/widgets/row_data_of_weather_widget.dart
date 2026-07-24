import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/custom_text_widget.dart';

class RowDataOfWeather extends StatelessWidget {
  final WeatherModel weatherModel;
  const RowDataOfWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network('https:${weatherModel.icon}', width: 64, height: 64),
          CustomText(
            text: '${weatherModel.avgtemp.toStringAsFixed(1)}°C',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          Column(
            children: [
              CustomText(
                text: 'MaxTemp: ${weatherModel.maxtemp.toStringAsFixed(1)}°C',
                fontSize: 14,
                color: Colors.white,
              ),
              CustomText(
                text: 'MinTemp: ${weatherModel.mintemp.toStringAsFixed(1)}°C',
                fontSize: 14,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
