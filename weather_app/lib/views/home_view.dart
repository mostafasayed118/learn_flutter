import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_widget_bold.dart';
import 'package:weather_app/widgets/text_widget_normal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidgetBold(text: 'Cairo', fontSize: 24, color: Colors.black),
            TextWidgetNormal(
              text: 'Updated at 11:00',
              fontSize: 20,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextWidgetNormal(
                  text: '25°C',
                  fontSize: 48,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                TextWidgetNormal(
                  text: 'Sunny',
                  fontSize: 24,
                  color: Colors.black,
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
