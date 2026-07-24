import 'package:dio/dio.dart';
import 'package:weather_app/constants/app_constants.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeatherData({required String cityName}) async {
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}/forecast.json',
        queryParameters: {
          'key': AppConstants.apiKey,
          'q': cityName,
          'days': '1',
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      final weatherData = response.data;
      return WeatherModel.fromJson(weatherData);
    } on DioException catch (e) {
      final errorMessage =
          (e.response?.data is Map && (e.response!.data as Map)['error'] is Map)
              ? ((e.response!.data as Map)['error'] as Map)['message'] as String
              : 'Oops! Something went wrong. Please try again later.';
      throw Exception('Failed to load weather data: $errorMessage');
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
