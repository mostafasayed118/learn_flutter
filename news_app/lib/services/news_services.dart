import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getNews() async {
    try {
      final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=228fad43848e4390ae5fa55daf65a447',
      );
      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data['articles'];
      List<ArticleModel> articleModels = articles
          .map((article) => ArticleModel.fromJson(article))
          .toList();

      return {'articles': articleModels};
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}