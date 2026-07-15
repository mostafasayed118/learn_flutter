import 'package:flutter/material.dart';
import 'package:news_app/main.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';

enum NewsStatus { loading, loaded, error }

class NewsViewModel extends ChangeNotifier {
  NewsViewModel({NewsServices? newsServices})
    : _newsServices = newsServices ?? NewsServices(dio);

  final NewsServices _newsServices;

  NewsStatus _status = NewsStatus.loading;
  List<ArticleModel> _articles = [];
  String? _errorMessage;

  NewsStatus get status => _status;
  List<ArticleModel> get articles => _articles;
  String? get errorMessage => _errorMessage;

  Future<void> loadNews([String category = 'general']) async {
    _status = NewsStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await _newsServices.getTopHeadlinesNews(category: category);
      _status = NewsStatus.loaded;
    } catch (e) {
      _errorMessage = 'Failed to load news. Check your connection.';
      _status = NewsStatus.error;
    }
    notifyListeners();
  }
}
