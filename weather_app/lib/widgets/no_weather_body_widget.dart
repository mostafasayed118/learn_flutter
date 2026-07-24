import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_text_widget.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Welcome to the Weather App 🌤️',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 40),
          CustomText(
            text: 'There is no weather 😌 start ',
            fontSize: 24,
            color: Colors.grey,
          ),
          CustomText(
            text: 'searching now 🔍',
            fontSize: 24,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
