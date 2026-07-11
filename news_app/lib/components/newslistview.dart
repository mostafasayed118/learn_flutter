import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            Padding(padding: const EdgeInsets.all(8.0), child: NewsTile()),
        childCount: 10, // Replace with actual news count
      ),
    );
  }
}
