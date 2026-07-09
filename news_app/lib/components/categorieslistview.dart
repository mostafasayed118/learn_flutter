import 'package:flutter/material.dart';
import 'package:news_app/components/category_card.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryName: 'Business',
      imageAssets: 'assets/business.jpeg',
    ),
    CategoryModel(
      categoryName: 'Entertainment',
      imageAssets: 'assets/entertaiment.jpeg',
    ),
    CategoryModel(categoryName: 'General', imageAssets: 'assets/general.jpeg'),
    CategoryModel(categoryName: 'Health', imageAssets: 'assets/health.jpeg'),
    CategoryModel(categoryName: 'Science', imageAssets: 'assets/science.jpeg'),
    CategoryModel(categoryName: 'Sports', imageAssets: 'assets/sports.jpeg'),
    CategoryModel(
      categoryName: 'Technology',
      imageAssets: 'assets/technology.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
