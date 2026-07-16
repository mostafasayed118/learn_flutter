import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_widget_grey.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Weather App 🌤️',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          TextWidgetGrey(text: 'There is no weather 😌 start '),
          TextWidgetGrey(text: 'searching now 🔍'),
        ],
      ),
    );
  }
}
