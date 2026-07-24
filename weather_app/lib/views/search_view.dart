import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/utils/theme_utils.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              final condition = state is WeatherLoadedState
                  ? state.weatherModel.condition
                  : "";
              return TextField(
                onSubmitted: (value) async {
                  final navigator = Navigator.of(context);
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  await getWeatherCubit.getWeather(cityName: value);
                  final state = getWeatherCubit.state;
                  if (state is WeatherLoadedState) {
                    log(state.weatherModel.toString());
                  } else if (state is WeatherFailedState) {
                    log(state.errorMessage);
                  }

                  navigator.pop();
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: getThemeColor(condition),
                  ),
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: getThemeColor(condition),
                    ),
                    gapPadding: 4.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: getThemeColor(condition),
                    ),
                    gapPadding: 4.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: getThemeColor(condition),
                    ),
                    gapPadding: 4.0,
                  ),
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: getThemeColor(condition),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
