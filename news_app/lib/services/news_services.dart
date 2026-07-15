import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio;

  static const String apiKey = '228fad43848e4390ae5fa55daf65a447';

  static const String baseUrl = 'https://newsapi.org/v2';
  List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  NewsServices(this.dio);

  Future<List<ArticleModel>> getTopHeadlinesNews({
    required String category,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/top-headlines?country=us&apiKey=$apiKey&category=$category',
      );
      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data['articles'];
      List<ArticleModel> articleModels = articles
          .map((article) => ArticleModel.fromJson(article))
          .toList();
      return articleModels;
    } catch (e) {
      rethrow;
    }
  }
}
