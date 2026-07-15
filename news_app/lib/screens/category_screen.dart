import 'package:flutter/material.dart';
import 'package:news_app/components/newslistview.dart';
import 'package:news_app/viewmodels/news_view_model.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel()..loadNews(category),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            category[0].toUpperCase() + category.substring(1),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            NewsListView(category: 'business'),
          ],
        ),
      ),
    );
  }
}
