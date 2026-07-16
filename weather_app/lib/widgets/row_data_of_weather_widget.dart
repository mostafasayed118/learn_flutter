import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_widget_bold.dart';
import 'package:weather_app/widgets/text_widget_normal.dart';

class RowDataOfWeather extends StatelessWidget {
  const RowDataOfWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/cloudy.png', width: 100, height: 100),
          TextWidgetBold(text: '25°C', fontSize: 32, color: Colors.black),

          Column(
            children: [
              TextWidgetNormal(
                text: 'MaxTemp: 30°C',
                fontSize: 12,
                color: Colors.black,
              ),
              TextWidgetNormal(
                text: 'MinTemp: 20°C',
                fontSize: 12,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
