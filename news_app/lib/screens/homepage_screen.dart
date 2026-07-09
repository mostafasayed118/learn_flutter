import 'package:flutter/material.dart';
import 'package:news_app/components/categorieslistview.dart';
import 'package:news_app/components/category_card.dart';

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
            Text('News', style: TextStyle(color: Colors.black)),
            Text('Claude', style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
      body: CategoriesListView(),
    );
  }
}

