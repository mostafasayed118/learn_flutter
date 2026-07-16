import 'package:flutter/material.dart';
import 'package:weather_app/widgets/row_data_of_weather_widget.dart';
import 'package:weather_app/widgets/text_widget_bold.dart';
import 'package:weather_app/widgets/text_widget_normal.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidgetBold(text: 'Cairo', fontSize: 24, color: Colors.black),
          TextWidgetNormal(
            text: 'Updated at 11:00',
            fontSize: 20,
            color: Colors.black,
          ),
          RowDataOfWeather(),
          TextWidgetBold(text: 'Light Rain', fontSize: 24, color: Colors.black),
        ],
      ),
    );
  }
}
