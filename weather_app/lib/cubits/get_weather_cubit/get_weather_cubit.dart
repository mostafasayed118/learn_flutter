import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  Future<void> getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeatherData(cityName: cityName);

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailedState());
    }
  }
}
