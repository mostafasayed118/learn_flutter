import 'package:flutter/material.dart';
import 'package:news_app/components/error_message.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/viewmodels/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewsViewModel>();

    switch (viewModel.status) {
      case NewsStatus.loading:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
              strokeWidth: 2,
            ),
          ),
        );
      case NewsStatus.error:
        return SliverFillRemaining(
          hasScrollBody: false,
          child: ErrorMessage(viewModel: viewModel),
        );
      case NewsStatus.loaded:
        if (viewModel.articles.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('No articles available.')),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: NewsTile(article: viewModel.articles[index]),
            ),
            childCount: viewModel.articles.length,
          ),
        );
    }
  }
}
