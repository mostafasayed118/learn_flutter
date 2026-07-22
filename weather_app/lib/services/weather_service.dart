import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = '6f2b0082d3414b69994165406261607';
  final String baseUrl = 'https://api.weatherapi.com/v1';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeatherData({required String cityName}) async {
    try {
      final response = await dio.get(
        '$baseUrl/current.json',
        queryParameters: {'key': apiKey, 'q': cityName, 'aqi': 'no'},
      );

      final weatherData = response.data;
      return WeatherModel.fromJson(weatherData);
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ??
          'Oops! Something went wrong. Please try again later.';
      throw Exception('Failed to load weather data: $errorMessage');
    }
    catch (e) {
      throw Exception('Failed to load weather data: ');
    }
  }
}
