import 'package:flutter/material.dart';
import 'package:news_app/components/categorieslistview.dart';
import 'package:news_app/components/newslistview.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Claude',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
    );
  }
}
