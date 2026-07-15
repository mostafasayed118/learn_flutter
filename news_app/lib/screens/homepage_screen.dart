import 'package:flutter/material.dart';
import 'package:news_app/components/categorieslistview.dart';
import 'package:news_app/components/hadline_widget.dart';
import 'package:news_app/components/newslistview.dart';
import 'package:news_app/viewmodels/news_view_model.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsViewModel()..loadNews(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: headline_widget(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(child: const SizedBox(height: 10)),
              const NewsListView(),
            ],
          ),
        ),
      ),
    );
  }
}

